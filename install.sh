#!/usr/bin/env bash

set -euo pipefail

core() {
    echo "Installing packages"
    sudo dnf -y copr enable gagbo/kitty-latest
    sudo dnf -y install --refresh zsh vim-X11 vim-enhanced stow fzf ripgrep fd-find bat kitty proselint

    echo "Changing shell"
    chsh -s /bin/zsh
}

dofiles() {
    echo "Loading dotfiles"
    mkdir -p $HOME/code
    git clone git@github.com:charithe/dotfiles.git $HOME/code/dotfiles
    cd $HOME/code/dotfiles && make
}

fonts() {
    mkdir -p $HOME/.fonts; cd $HOME/.fonts

    wget "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz"
    tar xf Hack-v3.003-ttf.tar.gz --transform 's/ttf/Hack/'
    rm Hack-v3.003-ttf.tar.gz

    wget "https://github.com/IBM/plex/releases/download/v1.2.3/TrueType.zip"
    unzip TrueType.zip
    mv TrueType Plex
    rm TrueType.zip

    wget "https://github.com/tonsky/FiraCode/releases/download/1.206/FiraCode_1.206.zip"
    unzip FiraCode_1.206.zip
    rm FiraCode_1.206.zip

    fc-cache -v
    #    git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git
    #    nerd-fonts/install.sh 
    #    rm -rf nerd-fonts
}

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 all|core|dotfiles|fonts"
    exit 2
fi

pushd .

case "$1" in
    "all")
        core && dotfiles && fonts
        ;;
    "core")
        core
        ;;
    "dotfiles")
        dotfiles
        ;;
    "fonts")
        fonts
        ;;
    *)
        echo "Unknown command"
        ;;
esac

popd

