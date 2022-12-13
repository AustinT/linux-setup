# Create default vimrc that links to this repo
# In the future I should use the `runtime` command instead of
# `source` but it didn't work when I tried it...
vim_dir="$HOME/.vim"
mkdir -p "$vim_dir"
vimrc_path="${vim_dir}/vimrc"
if [[ ! -f "$vimrc_path" ]] ; then
    echo "source $(pwd)/vimrc" > "${vimrc_path}"
fi

plugin_dir="${vim_dir}/pack/plugins/start"
mkdir -p "$plugin_dir"
cd "$plugin_dir"

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

# Python-mode (currently disabled)
#git clone --recurse-submodules https://github.com/python-mode/python-mode.git

# Solarized8
git clone https://github.com/lifepillar/vim-solarized8.git
#echo "Remember to add colorscheme script to bashrc"

# gruvbox
git clone https://github.com/morhetz/gruvbox

# vim-pandoc (and syntax)
git clone https://github.com/vim-pandoc/vim-pandoc
git clone https://github.com/vim-pandoc/vim-pandoc-syntax

# vimwiki
git clone https://github.com/vimwiki/vimwiki

# Calendar vim
git clone https://github.com/mattn/calendar-vim.git

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
