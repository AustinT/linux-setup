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

" Pane switching made easy
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ween yourself off arrow keys
" (comment for scoll support later)

noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

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

" markdown.pandoc
" Settings borrowed from: https://gitlab.com/skilstak/config/vim/blob/master/vimrc

let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#conceal#blacklist = ["atx","codeblock_start","codeblock_delim"]
au syntax * hi link pandocAtxStart Type 
au syntax * hi link pandocAtxHeader Type
au syntax * hi Default cterm=none term=none
au syntax * hi pandocEmphasis cterm=none term=none ctermfg=Magenta 
au syntax * hi pandocStrong cterm=bold term=bold ctermfg=Magenta 
au syntax * hi pandocStrongEmphasis cterm=none term=none ctermfg=Red
au syntax * hi link pandocDelimitedCodeBlock pandocNoFormatted
au syntax * hi SpellBad ctermfg=White ctermbg=Red cterm=none

