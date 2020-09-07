" Plugins
" Before installing the first time, run the following command:
" pip3 install --user neovim 

" Auto install vim-plug
let plug_install = 0
let vim_plug_path = '~/.local/share/nvim/site/autoload/plug.vim'
if empty(glob(vim_plug_path))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    silent !pip3 install --user pynvim flake8 mypy jedi 
    execute 'source ' . fnameescape(vim_plug_path)
    let plug_install = 1
endif
unlet vim_plug_path

call plug#begin('~/.vim/plugged')

" Editor
Plug 'scrooloose/nerdtree'		" NERD Tree
Plug 'vim-airline/vim-airline'		" Airline status bar
Plug 'vim-airline/vim-airline-themes'	" Airline status themes
Plug 'morhetz/gruvbox'			" Gruvbox theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fzf
Plug 'junegunn/fzf.vim'			" Fzf but better

" Dev
Plug 'editorconfig/editorconfig-vim'	" Editorconfig
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Deoplete (autocompletion)
Plug 'jiangmiao/auto-pairs'		" Auto pairs (, 
Plug 'scrooloose/nerdcommenter'		" NERD commenter
Plug 'sheerun/vim-polyglot'		" Syntax to a bunch of file extensions
Plug 'airblade/vim-gitgutter'		" Git integration
Plug 'tpope/vim-fugitive'		" Git integration

" Python
Plug 'tmhedberg/SimpylFold'		" Simply Fold
Plug 'zchee/deoplete-jedi'		" Jedi completion
Plug 'davidhalter/jedi-vim'		" Jedi Go-to definition...
Plug 'neomake/neomake'			" Code formatting
Plug 'jmcantrell/vim-virtualenv'	" Virtualenv awareness

" Elixir
Plug 'slashmili/alchemist.vim'		" Elixir autocomplete to deoplete

" Node & Typescript
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Icons, must be installed last
Plug 'ryanoasis/vim-devicons'

call plug#end()



" If this is first installation, sync everything
if plug_install
    PlugInstall --sync
endif
unlet plug_install
