#!/bin/sh

CURRENTDIR="$(pwd)"
GREEN="\033[32m"
RED="\033[31m"
DEFAULTC="\033[0m"

echo "${GREEN}Welcome to ivabus .dotfiles installer$DEFAULTC"
echo "Dotfiles will be installed to $HOME/.dotfiles"
echo "Press enter to continue"
read A

# check for zsh

if ! command -v zsh > /dev/null
then
    echo "zsh is not installed"
    echo "${RED}Aborting.$DEFAULTC"
    exit 255
fi

# install oh-my-zsh and plugins

ZSH="$HOME/.dotfiles/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null
curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme -o $HOME/.dotfiles/oh-my-zsh/custom/themes/ivabus.zsh-theme > /dev/null
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.dotfiles/oh-my-zsh/custom/plugins/zsh-autosuggestions > /dev/null

# linking dotfiles to their original locations

sh $HOME/.dotfiles/tools/relink.sh

cd $CURRENTDIR

echo "${GREEN}Dotfiles installed and linked.$DEFAULTC"