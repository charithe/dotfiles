if [[ ! -d ~/.zplug ]]; then
    git clone git@github.com:zplug/zplug.git ~/.zplug
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'sorin-ionescu/prezto'
zplug 'BrandonRoehl/zsh-clean'
zplug 'zchee/zsh-completions', use:'src/go/*.zsh'
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, at:master

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

#RPROMPT='%F{white}%*'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\UE0BC'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\UE0BA'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}❱❱❱%f "

POWERLEVEL9K_DIR_HOME_BACKGROUND='027'
POWERLEVEL9K_DIR_HOME_FOREGROUND='254'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='027'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='254'

POWERLEVEL9K_KUBECONTEXT_BACKGROUND='093'
POWERLEVEL9K_KUBECONTEXT_FOREGROUND='254'


POWERLEVEL9K_VCS_CLEAN_BACKGROUND="black"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="lightcoral"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="black"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="maroon"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"



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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/cell/.sdkman"
[[ -s "/home/cell/.sdkman/bin/sdkman-init.sh" ]] && source "/home/cell/.sdkman/bin/sdkman-init.sh"
