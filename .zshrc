
# FUCK WSL
#lim=`ulimit -n`
#if [ $lim -lt 8000 ]
#then
#	sudo prlimit -p "$$" --nofile=65000:65000
#	exec zsh
#	exit
#fi

if [[ $WSLGIT ]]; then
  exit 0
fi

unset PS1

alias lsgit='colorls --gs'
alias ls='lsd'
alias ll='ls -l'
alias lla='ls -Al'
alias lal='ls -Al'
alias la='ls -A'
alias grep='grep --color=auto'

if [[ $WSLENV ]]; then
	alias reboot='/C/Windows/System32/shutdown.exe /r /f /t'
	alias wcodep='winrun cmd.exe /c code.cmd'
	alias wcode='f_code(){ wcodep $(wslpath ""$@""); unset -f f_code; }; f_code'
	alias wopen='winrun cmd.exe /C start'
	alias choco='cmd.exe /C choco.exe'
	alias open='wsl-open'

	alias cmd='cmd.exe'
else
	alias open='xdg-open'
fi
alias clears="clear && screenfetch -c 9,7"

alias xccf='xclip-copyfile' #copy file to clipboard

alias gh='history | grep '
alias lsg='ls | grep'

alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --all --decorate --oneline --graph'
alias glr='git log --oneline --graph --decorate $(git rev-list -g --all)' 
alias gaa='git add -A'
alias gp='git pull --rebase --autostash'

alias pacman='sudo pacman --color=auto'

alias be='bundle exec'


if [[ $WSLENV ]]; then
	alias tk='winrun taskkill.exe'
	alias tki='winrun taskkill.exe /im'
fi

#just for fun :D
alias please='sudo'
alias canadiansudo='echo "please"'

alias pikaur='HOME=/home/alia5 pikaur'

if [[ $WSLENV ]]; then
	alias winget='gsudo winget.exe'
fi

export PATH="$(ruby -e 'print Gem.user_dir')/bin:$HOME/.local/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

eval $(thefuck --alias)

#export PROMPT="$(git-radar --zsh --fetch)\$ "

#source $(dirname $(gem which colorls))/tab_complete.sh

#export XDG_CONFIG_HOME=~/.config
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
#export $(dbus-launch)
#export PULSE_SERVER=tcp:localhost

export EDITOR=vim

          # Adding wsl-open as a browser for Bash for Windows
            #if [[ -z  ]]; then
	if [[ $WSLENV ]]; then	    
              export BROWSER=wsl-open
            #else
            #  export BROWSER=:wsl-open
            #fi
          fi

eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

setopt auto_cd autopushd

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

#zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

cd () {
    if [[ "x$*" = "x..." ]]
    then
            cd ../..
    elif [[ "x$*" = "x...." ]]
    then
            cd ../../..
    elif [[ "x$*" = "x....." ]]
    then
        cd ../../..
    elif [[ "x$*" = "x......" ]]
    then
            cd ../../../..
    else
            builtin cd "$@"
    fi
}

export ZSH_AUTOSUGGEST_USE_ASYNC=1
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh         

eval "$(zoxide init zsh)"

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

POWERLEVEL9K_RVM_BACKGROUND="grey19"
POWERLEVEL9K_RVM_FOREGROUND="grey74"

POWERLEVEL9K_STATUS_OK_BACKGROUND="grey30"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='red'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="grey19"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='orangered1'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="grey19"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="grey19"

POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="grey74"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=088

POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='178'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_SHORTEN_STRATEGY="none"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon time user rvm dir root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time history vcs)

source /usr/share/zsh-theme-powerlevel10k/powerlevel9k.zsh-theme

source  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


# tmux rename ssh windows
if [[ $TMUX ]]; then
  ssh() {
    tmux rename-window "ssh $*"
    command ssh "$@"
    tmux set automatic-rename on
  }
fi



if [[ "$HOST" == *"steamdeck"* ]]; then
  neofetch --ascii_distro SteamOS
else
  neofetch --colors 160 124 124 124 124 7 --ascii_colors 124 160
fi

#screenfetch -c 9,7

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

# obviate file extension typing for windoze executables
if [[ $WSLENV ]]; then
command_not_found_handler()
{
   cmd=$1
   shift
   args=( "$@" )

   saveIFS="$IFS"
   IFS=:
   for dir in ${(@s/:/)PATH}; do
      for executable in "$dir/$cmd.exe" "$dir/$cmd.com" "$dir/$cmd.bat"; do
         if [ -x $executable ]; then
            IFS="$saveIFS"
            "$executable" "${args[@]}"
            return
         fi
      done
   done

   IFS="$saveIFS"
   if [ -x /usr/lib/command-not-found ]; then
      /usr/lib/command-not-found -- "$cmd" "${args[@]}"
      return $?
   elif [ -x /usr/share/command-not-found/command-not-found ]; then
      /usr/share/command-not-found/command-not-found -- "$1" "${args[@]}"
      return $?
   else
      printf "%s: command not found\n" "$cmd" >&2
      return 127
   fi
}
fi

# node stuff
source /usr/share/nvm/init-nvm.sh

export PATH="node_modules/.bin:$PATH"
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PATH=~/.local/bin:$PATH

# go stuff
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export PATH=$PATH:~/go/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# pnpm
export PNPM_HOME="/home/alia5/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end