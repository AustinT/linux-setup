syntax enable " enable syntax processing                                
set number " show line numbers
set showcmd " show command in bottom bar
" set cursorline " highlight current line
set wildmode=longest,list,full " some tab completion
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when necessary
set showmatch " highlight matching [{()}]
set hlsearch " highlight matches
set incsearch " search as characters are entered
set fileformat=unix " Apparently avoids compatibility issues
set encoding=utf-8 " Default encoding to unicode!
" set ssop-=options " do not store global and local values in a session

" Default tab behaviour (configured like python)
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set expandtab " tabs are spaces
set autoindent

" Screen splitting
set splitbelow
set splitright

" Folding
set foldmethod=indent
set foldlevel=99

" Spell check for certain file types
autocmd BufRead,BufNewFile *.md,*.tex setlocal spell

" Pathogen settings
" install pathogen from here
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
filetype plugin indent on " load filetype-specific indent files

" Attempt at setting solarized Colourscheme
set background=dark
colorscheme solarized8
