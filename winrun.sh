#!/bin/bash

command=$1
args=${@:2}
winrun_pid=$$
pidfile="/tmp/winrun-pid-$(date +%s)"

if [[ $args != '' ]]; then
  argumentlist="-ArgumentList \"$args\""
fi

powershell_command="
\$process = Start-Process -NoNewWindow -PassThru \"$command\" $argumentlist
if (\$process) {
  echo \$process.id
  Wait-Process \$process.id
  exit \$process.ExitCode
} else {
  # startup failure
  echo -1
}"

powershell.exe -Command "$powershell_command" > $pidfile &
linux_pid=$!

# Use tail to wait for the file to be populated
while read -r line; do
  windows_pid=$(echo $line | tr -d '\r\n')
  break # we only need the first line
done < <(tail -f $pidfile)
rm $pidfile

if [[ $windows_pid == -1 ]]; then
  exit 127
fi

term() {
  taskkill.exe -pid $windows_pid > /dev/null
}

trap term SIGTERM
trap term SIGINT

while ps -p $linux_pid > /dev/null; do
  wait $linux_pid
done
exit $?
