# Pathogen
apt-get install curl
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install pathogen plugins
orig_dir=$(pwd)
cd ~/.vim/bundle

# Supertab
git clone https://github.com/ervandew/supertab.git

# Python-mode
git clone --recurse-submodules https://github.com/python-mode/python-mode.git

# Solarized8
git clone https://github.com/lifepillar/vim-solarized8.git
echo "Remember to add colorscheme script to bashrc"

cd $orig_dir
