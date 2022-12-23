local opt = {silent = true, noremap = true}

vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>",opt)

-- Alternative to Alt-Up and Alt-Down in vscode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",opt)
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv",opt)

-- Fast search and replace for all occurences
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>",opt)
-- Fast search
vim.keymap.set("n", ";s", "/",opt)
-- Fast save
vim.keymap.set("n", ";w", ":w<CR>",opt)

-- Remap CTRL-c to <esc>
vim.keymap.set("n", "<C-c>","<esc>",opt)
vim.keymap.set("i", "<C-c>","<esc>",opt)
vim.keymap.set("v", "<C-c>","<esc>",opt)
vim.keymap.set("o", "<C-c>","<esc>",opt)

-- Remap CTRL-{h,j,k,l} to arrows in insert mode
vim.keymap.set("i","<C-h>","<Left>",opt)
vim.keymap.set("i","<C-j>","<Down>",opt)
vim.keymap.set("i","<C-k>","<Up>",opt)
vim.keymap.set("i","<C-l>","<Right>",opt)

