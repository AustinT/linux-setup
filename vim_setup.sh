
# Copy .vimrc
cp ./.vimrc ~

# Pathogen
apt-get install curl
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install pathogen plugins
cd ~/.vim/bundle

# vim-sensible: sensible defaults for vim
git clone https://github.com/tpope/vim-sensible

# ctrlp plugin (for file search)
git clone https://github.com/ctrlpvim/ctrlp.vim

# vim-surround (and vim-repeat to complete its functionality)
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-repeat

# Nerd commenter
git clone https://github.com/preservim/nerdcommenter

# Nerd tree
git clone https://github.com/preservim/nerdtree

# Supertab
git clone https://github.com/ervandew/supertab.git

# fugitive (git integration)
git clone https://github.com/tpope/vim-fugitive

# Python-mode
git clone --recurse-submodules https://github.com/python-mode/python-mode.git

# Solarized8
git clone https://github.com/lifepillar/vim-solarized8.git
echo "Remember to add colorscheme script to bashrc"

# vim-pandoc (and syntax)
git clone https://github.com/vim-pandoc/vim-pandoc
git clone https://github.com/vim-pandoc/vim-pandoc-syntax

# vimwiki
git clone https://github.com/vimwiki/vimwiki.git

# Back to original directory
cd -

# NOTES:
# Packages to consider getting:

# Vim-airline (nice status bar): https://vimawesome.com/plugin/vim-airline-superman

# Instead of python-mode:
# ================================================
# you complete me/syntastic/vim-flake8 (should be about the same)

# You Complete Me
# git clone --recurse-submodules https://github.com/ycm-core/YouCompleteMe

# Syntastic (syntax checking)
# https://vimawesome.com/plugin/syntastic
