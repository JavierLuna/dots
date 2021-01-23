" Keybindings

"    NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Fzf
" map <C-R> :Files <CR>
nnoremap <expr> <C-r> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

"    Splits
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-S-Up> :resize +2<CR> 
nnoremap <C-S-Down> :resize -2<CR>
nnoremap <C-S-Left> :vertical resize -2<CR>
nnoremap <C-S-Right> :vertical resize +2<CR>
nnoremap <C-s> :vsp <CR>

" Sudo write
cmap w!! w !sudo tee % >/dev/null
