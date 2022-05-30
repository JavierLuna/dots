local map = nvchad.map

map("n", "<C-S-Up>", ":resize +2 <CR>")
map("n", "<C-S-Down>", ":resize -2 <CR>")
map("n", "<C-S-Left>", ":vertical resize -2 <CR>")
map("n", "<C-S-Right>", ":vertical resize +2 <CR>")

map("n", "<leader>,", ":BufferLineCyclePrev <CR>")
map("n", "<leader>.", ":BufferLineCycleNext <CR>")
map("n", "<leader>m,", ":BufferLineMovePrev <CR>")
map("n", "<leader>m.", ":BufferLineMoveNext <CR>")
