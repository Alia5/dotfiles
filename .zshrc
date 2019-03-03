unset PS1

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


alias pacman='sudo pacman --color=auto'

alias catc='highlight'

alias be='bundle exec'

alias tk='taskkill.exe'
alias tki='taskkill.exe /im'

#just for fun :D
alias please='sudo'
alias canadiansudo='echo "please"'

alias pikaur='HOME=/home/alia5 pikaur'


export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

eval $(thefuck --alias)

#export PROMPT="$(git-radar --zsh --fetch)\$ "


source $(dirname $(gem which colorls))/tab_complete.sh

export XDG_CONFIG_HOME=~/.config
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1
export $(dbus-launch)
#export QT_SCALE_FACTOR=1.5
#export GDK_SCALE=1.5

export EDITOR=vim

#vuframe
source "$HOME/.vfbashrc"
#\vuframe


          # Adding wsl-open as a browser for Bash for Windows
          if [[ $(uname -r) == *Microsoft ]]; then
            #if [[ -z  ]]; then
		    
              export BROWSER=wsl-open
            #else
            #  export BROWSER=:wsl-open
            #fi
          fi

eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word 

# enable Ctrl-x-e to edit command line ---------------------

autoload -U edit-command-line
zle -N edit-command-line
# Emacs style
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
bindkey -M vicmd v edit-command-line

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit


export ZSH_AUTOSUGGEST_USE_ASYNC=1
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh         

#powerline-daemon -q 
#. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_TIME_BACKGROUND="grey35"
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="grey35"
POWERLEVEL9K_DIR_HOME_BACKGROUND="grey35"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="grey35"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"

POWERLEVEL9K_OS_ICON_FOREGROUND="black"
POWERLEVEL9K_OS_ICON_BACKGROUND="grey82"

POWERLEVEL9K_USER_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND=088

POWERLEVEL9K_STATUS_OK_BACKGROUND="grey30"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='red'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon time user rvm dir root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time history vcs)

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme


source  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#neofetch 
screenfetch -c 9,7

## History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt no_hist_verify


