if [[ ! -d ~/.zplug ]]; then
    git clone git@github.com:zplug/zplug.git ~/.zplug
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'sorin-ionescu/prezto'
zplug 'BrandonRoehl/zsh-clean'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/cell/.sdkman"
[[ -s "/home/cell/.sdkman/bin/sdkman-init.sh" ]] && source "/home/cell/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cell/apps/google-cloud-sdk/path.zsh.inc' ]; then . '/home/cell/apps/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/cell/apps/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/cell/apps/google-cloud-sdk/completion.zsh.inc'; fi
