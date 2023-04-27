#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='bat'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_GB.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi


export GOPATH=$HOME/code/go
export PATH=$PATH:$HOME/bin:/usr/local/go/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.krew/bin:$HOME/.local/bin:$HOME/.arkade/bin:$HOME/.pyprojectx
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_CMD='fd --type f'
export QT_DEVICE_PIXEL_RATIO=auto
export QT_AUTO_SCREEN_SCALE_FACTOR=true
export REVIEW_BASE=main
export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock
export KIND_EXPERIMENTAL_PROVIDER=podman
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
