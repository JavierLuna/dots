" Keybindings

" Remap hjkl to my spanish keyboard
noremap j h
noremap k j
noremap l k
noremap ñ l

"    NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Fzf
" map <C-R> :Files <CR>
nnoremap <expr> <C-r> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

"    Splits
nnoremap <C-Down> :TmuxNavigateDown <cr> 
nnoremap <C-Up> :TmuxNavigateUp <cr>
nnoremap <C-Right> :TmuxNavigateRight <cr>
nnoremap <C-Left> :TmuxNavigateLeft <cr>

nnoremap <C-S-Up> :resize +2<CR> 
nnoremap <C-S-Down> :resize -2<CR>
nnoremap <C-S-Left> :vertical resize -2<CR>
nnoremap <C-S-Right> :vertical resize +2<CR>

nnoremap <C-s> :vsp <CR>

" Sudo write
cmap w!! w !sudo tee % >/dev/null
