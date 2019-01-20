if [[ ! -d ~/.zplug ]]; then
    git clone git@github.com:zplug/zplug.git ~/.zplug
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'sorin-ionescu/prezto'
zplug 'BrandonRoehl/zsh-clean'
zplug 'zchee/zsh-completions', use:'src/go/*.zsh'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load 

setopt CDABLE_VARS
setopt auto_cd
cdpath=($HOME $HOME/code $HOME/git $GOPATH/src/github.com/charithe $GOPATH/src)

RPROMPT='%F{white}%*'

bindkey '^P' up-history
bindkey '^N' down-history

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

alias vim="gvim -v"
alias vi="gvim -v"
alias k="kubectl"

export BAT_THEME="TwoDark"
export BAT_STYLE="numbers,changes"


source /usr/share/fzf/shell/key-bindings.zsh
kitty + complete setup zsh | source /dev/stdin
