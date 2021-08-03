

unset PS1

alias ls='colorls --gs'
alias ll='ls -l'
alias lla='ls -Al'
alias lal='ls -Al'
alias la='ls -A'
alias grep='grep --color=auto'


alias xccf='xclip-copyfile' #copy file to clipboard

alias gh='history | grep '
alias lsg='ls | grep'


alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --all --decorate --oneline --graph'
alias gaa='git add -A'


alias catc='highlight'

alias be='bundle exec'




#just for fun :D
alias please='sudo'
alias canadiansudo='echo "please"'

export PATH="/Users/peter.repukat/Library/Python/3.9/bin:$PATH"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$HOME/.local/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')


eval $(thefuck --alias)

#export PROMPT="$(git-radar --zsh --fetch)\$ "


source $(dirname $(gem which colorls))/tab_complete.sh


export EDITOR=vim


          # Adding wsl-open as a browser for Bash for Windows
          if [[ $(uname -r) == *Microsoft ]]; then
            #if [[ -z  ]]; then
		    
              export BROWSER=wsl-open
            #else
            #  export BROWSER=:wsl-open
            #fi
          fi

eval "$(gdircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

setopt auto_cd autopushd

bindkey -e
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

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
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh         

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

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme


source  /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


neofetch --ascii_colors 9 9 9 9 9 9 9 9 --colors 9 9 9 9 
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

source /usr/local/opt/nvm/nvm.sh

export PATH="/usr/local/bin:node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
