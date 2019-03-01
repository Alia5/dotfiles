@echo off
chcp 65001
call SetEscChar
echo %ESC%[9999H
"%ConEmuBaseDirShort%\conemu-cyg-64.exe" --wsl -t -- tmux
