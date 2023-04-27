if [[ ! -d ~/.zplug ]]; then
    git clone git@github.com:zplug/zplug.git ~/.zplug
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'sorin-ionescu/prezto'
zplug 'romkatv/powerlevel10k', use:'powerlevel10k.zsh-theme'
zplug 'softmoth/zsh-vim-mode'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

zstyle ':completion:*' menu yes select

setopt CDABLE_VARS
setopt auto_cd
setopt hist_ignore_dups
setopt histignorespace
cdpath=($HOME $HOME/code $HOME/git $GOPATH/src/github.com/charithe $GOPATH/src $HOME/work)

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#RPROMPT='%F{white}%*'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\UE0BC'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\UE0BA'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs background_jobs custom_empty kubecontext)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{027}❱❱❱%f "

POWERLEVEL9K_DIR_HOME_BACKGROUND='027'
POWERLEVEL9K_DIR_HOME_FOREGROUND='254'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='027'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='254'

POWERLEVEL9K_KUBECONTEXT_BACKGROUND='031'
POWERLEVEL9K_KUBECONTEXT_FOREGROUND='254'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="055"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="254"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="210"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="000"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="009"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="000"

POWERLEVEL9K_STATUS_OK_BACKGROUND="055"
POWERLEVEL9K_STATUS_OK_FOREGROUND="254"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="210"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="000"

POWERLEVEL9K_TIME_BACKGROUND="027"
POWERLEVEL9K_TIME_FOREGROUND="254"

POWERLEVEL9K_CUSTOM_EMPTY="echo '🕱'"
POWERLEVEL9K_CUSTOM_EMPTY_BACKGROUND="000"
POWERLEVEL9K_CUSTOM_EMPTY_FOREGROUND="196"

#bindkey '^P' up-history
#bindkey '^N' down-history

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# ctrl-n to accept
bindkey '^n' autosuggest-accept
# ctrl-enter to accept and execute
bindkey '^[[M' autosuggest-execute
# ctrl-space to clear
bindkey '^ ' autosuggest-clear


alias vim="nvim"
alias vi="nvim"
alias k="kubectl"
alias gs="rg -g '!vendor/*' -S"
alias tl=" tag ln"
alias x=" xdg-open"
alias -s {go,md,rs,txt}=vim
alias ls="lsd"
alias lst="lsd --tree"
alias htop=btop
alias top=btop
alias rg="kitty +kitten hyperlinked_grep"
alias j=just
alias df=duf

#export BAT_THEME="TwoDark"
#export BAT_STYLE="numbers,changes"
export LS_COLORS="$(vivid generate snazzy)"
eval "$(zoxide init zsh)"

source /usr/share/fzf/shell/key-bindings.zsh
kitty + complete setup zsh | source /dev/stdin

function delete-branches() {
  git branch |
    grep --invert-match '\*' |
    cut -c 3- |
    fzf --multi --preview="git log {}" |
    xargs --no-run-if-empty git branch --delete --force
}


source /home/cell/.config/broot/launcher/bash/br

function tere() {
    local result=$(command tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

export NVM_DIR="$HOME/apps/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
