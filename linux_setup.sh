#!/bin/bash
# Note: this script includes some sudos,
# Because I don't want the whole thing to be run as sudo
# Consider installing the following manually
# anaconda, dropbox, zotero
# Also add ssh keys to github

# Enter my email to make configurations easier
if [[ -z "$1" ]] ; then
    echo 'Email argument not provided. Aborting!'
    exit 1
fi

echo "INSTALLING PROGRAMS.."
sudo apt-get dist-upgrade
sudo apt-get upgrade
sudo apt-get -y install vim git redshift anki tmux curl xclip
source install_chrome.sh

echo "CONFIGURING PROGRAMS..."
# Add my git stuff
git config --global user.name "Austin T."
git config --global user.email "$1"

# Add my vim rc file
git clone https://github.com/AustinT/my_vimrc.git
mv ./my_vimrc/.vimrc ~/
source ./my_vimrc/setup_vim_plugins.sh
rm -rf my_vimrc/

echo "GENERATING SSH KEYS..."
ssh-keygen -t rsa -b 4096 -C "$1"
# add to ssh agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

