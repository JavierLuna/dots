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
    \ set textwidth=120 |
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

" Black formatter
Plugin 'python/black'

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


" Configurations


"    NERD Tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"    Airline
let g:airline_theme='distinguished'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
colorscheme distinguished

"    YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

"    Black formatter
let g:black_linelength=120

"    Syntastic
let python_highlight_all=1
syntax on



" Key bindings

"     NERD Tree 
map <C-n> :NERDTreeToggle<CR>

"     YouCompleteMe
nnoremap <C-d> :YcmCompleter GoTo <CR>

"     Splitting
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
