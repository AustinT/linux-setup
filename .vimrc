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

" Fix potential issues with backspace
set backspace=indent,eol,start " because I had backspace issues

" ween yourself off arrow keys
" (comment for scoll support later)

" noremap <up> :echoerr "Umm, use k instead"<CR>
" noremap <down> :echoerr "Umm, use j instead"<CR>
" noremap <left> :echoerr "Umm, use h instead"<CR>
" noremap <right> :echoerr "Umm, use l instead"<CR>
" inoremap <up> <NOP>
" inoremap <down> <NOP>
" inoremap <left> <NOP>
" inoremap <right> <NOP>

" Spell check for certain file types
autocmd BufRead,BufNewFile *.md,*.tex,*.wiki setlocal spell

" Pathogen settings
" install pathogen from here
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
execute pathogen#helptags()
" filetype plugin indent on " load filetype-specific indent files

" Attempt at setting solarized Colourscheme
set termguicolors
set background=light
"colorscheme solarized8
let g:gruvbox_guisp_fallback = "bg"
autocmd vimenter * colorscheme gruvbox
" No italics by default! Fails remotely...
"let g:gruvbox_italic = 1 

" markdown.pandoc
" Settings borrowed from: https://gitlab.com/skilstak/config/vim/blob/master/vimrc

let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#conceal#blacklist = ["atx","codeblock_start","codeblock_delim"]
au syntax * hi link pandocAtxStart Type 
au syntax * hi link pandocAtxHeader Type
au syntax * hi Default cterm=none term=none
" au syntax * hi pandocStrong cterm=bold term=bold ctermfg=Magenta 
" au syntax * hi pandocStrongEmphasis cterm=none term=none ctermfg=Red
au syntax * hi link pandocDelimitedCodeBlock pandocNoFormatted
au syntax * hi SpellBad ctermfg=White ctermbg=Red cterm=none

" vimwiki
set nocompatible
" Some tips from: https://opensource.com/article/18/6/vimwiki-gitlab-notes
let wiki_1 = {}
let wiki_1.path = '~/Documents/work-wiki'
let g:vimwiki_list = [wiki_1]

" python-mode
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-Space>'

