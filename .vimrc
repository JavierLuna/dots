" VIM jluna configuration

" General vim

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set nu
set clipboard=unnamedplus



" Python file completion
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim


" Plugins
call vundle#begin()
" Required by Vundle
Plugin 'VundleVim/Vundle.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" SimplyFold
Plugin 'tmhedberg/SimpylFold'

" Auto indent
Plugin 'vim-scripts/indentpython.vim'

" Fuzzy search
Plugin 'kien/ctrlp.vim'

" Syntax
Plugin 'vim-syntastic/syntastic'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Airline + Airline themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Distinguished theme
Plugin 'Lokaltog/vim-distinguished'



call vundle#end()

filetype plugin indent on

" NERD Tree
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
let g:airline_theme='distinguished'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
colorscheme distinguished

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

" Syntastic
let python_highlight_all=1
syntax on

" Key bindings

"     NERD Tree 
map <C-n> :NERDTreeToggle<CR>

" YouCompleteMe
nnoremap <C-d> :YcmCompleter GoTo <CR>
