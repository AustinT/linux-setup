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
sudo apt-get -y install vim git redshift tmux curl xclip \
        make cmake gcc g++ libpng-dev zlib1g-dev \
        mpv python python-dev p7zip-full \
        nodejs npm keepassxc fzf
source install_chrome.sh

echo "CONFIGURING PROGRAMS..."
# Add my git stuff
git config --global user.name "Austin T."
git config --global user.email "$1"

# Add my vim rc file/plugins
source setup_vimrc.sh

# Move configs
# Setup tmux
. tmux.sh

# ssh keys
echo "GENERATING SSH KEYS..."
source generate_ssh.sh $1

# Set up directories
echo "SETTING UP DIRECTORIES"
mkdir -p ~/scratch
