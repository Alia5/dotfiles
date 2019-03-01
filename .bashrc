#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='colorls --gs'
alias ll='ls -l'
alias lla='ls -Al'
alias lal='ls -Al'
alias la='ls -A'
alias grep='grep --color=auto'
alias reboot='/C/Windows/System32/shutdown.exe /r /f /t'
alias wcodep='cmd.exe /c code.cmd'
alias wcode='f_code(){ wcodep $(wslpath ""$@""); unset -f f_code; }; f_code'
alias vfgc='f_vfgc(){ git clone git@github.vuframe.com:Vuframe/$@.git; unset -f f_vfgc; }; f_vfgc'
alias wopen='cmd.exe /C start'
alias choco='choco.exe'
alias open='wsl-open'

alias xccf='xclip-copyfile' #copy file to clipboard

alias gh='history | grep '
alias lsg='ls | grep'


alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --all --decorate --oneline --graph'


alias pacman='pacman --color=auto'

alias catc='highlight'

alias be='bundle exec'

alias pikaur='HOME=/home/alia5 pikaur'

alias tk='taskkill.exe'
alias tki='taskkill.exe /im'

#just for fun :D
alias please='sudo'
alias canadiansudo='echo "please"'

#alias ruby='(ruby "$@" 3>&1 1>&2 2>&3 | grep -v "Insecure world writable dir"; exit ${PIPESTATUS[0]}) 3>&1 1>&2 2>&3'
#alias lolcat='(lolcat "$@" 3>&1 1>&2 2>&3 | grep -v "Insecure world writable dir"; exit ${PIPESTATUS[0]}) 3>&1 1>&2 2>&3'

export PS1="\t \[$(tput sgr0)\]\[\033[38;5;47m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;196m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;51m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\$(git-radar --bash --fetch)\$ \[$(tput sgr0)\]"

export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

eval $(thefuck --alias)


source $(dirname $(gem which colorls))/tab_complete.sh

export XDG_CONFIG_HOME=~/.config
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1
export $(dbus-launch)
#export QT_SCALE_FACTOR=1.5
#export GDK_SCALE=1.5

export EDITOR=vim


          # Adding wsl-open as a browser for Bash for Windows
          if [[ $(uname -r) == *Microsoft ]]; then
            #if [[ -z  ]]; then
		    
              export BROWSER=wsl-open
            #else
            #  export BROWSER=:wsl-open
            #fi
          fi
          

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#vuframe
source "$HOME/.vfbashrc"
#\vuframe

#neofetch
screenfetch
