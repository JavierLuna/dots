" Configurations

"    General vim
let mapleader=";"		" This leader is neater innit?
set noswapfile			" Don't generate swap files	
set encoding=utf-8		" Set encoding to utf-8
set clipboard=unnamedplus	" Use the system's primary clipboard
syntax on			" Enables syntax
set noshowmode			" Remove default mode indicator
set colorcolumn=120		" Colour the 120 char delimiter
set cursorline			" Highlights the line I'm typing in
set wildmenu			" Enhances command line completion
set backspace=indent,eol,start	" Makes sure backspace works
set splitright			" When splitting, it will do it on the right and below by default
set hlsearch			" Highlights search results
set confirm			" If :q, it will ask for confirmation instead of failing
set mouse=a			" Add mouse support


" Tmux integration
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2

" NERD Tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers=0

"    Airline bar
let g:airline_theme='gruvbox'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

"   Color scheme
set background=dark
colorscheme gruvbox

" Numbers
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Neomake
let g:neomake_python_enabled_makers = ['flake8', 'mypy']
call neomake#configure#automake('nrwi', 500) " Enables auto linting

" Neoformat
let g:neoformat_enabled_python = [ 'black' ]

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Fzf Porject
let g:fzfSwitchProjectWorkspaces = [ '~/Projects' ]
