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

# Supertab
git clone https://github.com/ervandew/supertab.git

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
