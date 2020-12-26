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
Plug 'morhetz/gruvbox'			" Gruvbox theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fzf
Plug 'junegunn/fzf.vim'			" Fzf but better


" Dev
Plug 'jiangmiao/auto-pairs'		" Auto pairs (, 
Plug 'scrooloose/nerdcommenter'		" NERD commenter
Plug 'sheerun/vim-polyglot'		" Syntax to a bunch of file extensions

" Python
Plug 'tmhedberg/SimpylFold'		" Simply Fold
Plug 'jmcantrell/vim-virtualenv'	" Virtualenv awareness

call plug#end()



" If this is first installation, sync everything
if plug_install
    PlugInstall --sync
endif
unlet plug_install
