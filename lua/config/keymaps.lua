local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", noremap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", noremap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", noremap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", noremap = true })

-- Resize window using <ctrl><shift> arrow keys
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Copy all.
map("n", "ya", "<CMD> %y+ <CR>",{ desc = "Copy All buffer" })
map('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>',{ silent = true, noremap = true })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>nf", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- windows
map("n", "<leader>wW", "<CMD>split<CR>",{ desc = "Split window below", noremap = true })
map("n", "<leader>ww", "<CMD>vsplit<CR>",{ desc = "Split window right", noremap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", noremap = true })

-- No weired jumps when searching.
map('n', 'n' , "nzzzv",{ desc = "Next match", noremap = true })
map('n', 'N' , "Nzzzv",{ desc = "Prev match", noremap = true })
map('v', 'f', 'y/\\V<C-r>"<cr>', {desc = "Search for highlighted word", noremap = true})

-- Goto begining and end of line.
map("i","<C-b>","<ESC>^i",{ desc = "Goto line begining", noremap = true })
map("i","<C-e>","<End>",{ desc = "Goto line end", noremap = true })

-- Keymaps for better default experience
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, noremap = true })

-- Remap CTRL-{h,j,k,l} to arrows in insert mode for better navigation.
map("i","<C-h>","<Left>",{ silent = true, noremap = true, desc="Move cursor left." })
map("i","<C-j>","<Down>",{ silent = true, noremap = true, desc="Move cursor down." })
map("i","<C-k>","<Up>",{ silent = true, noremap = true, desc="Move cursor up." })
map("i","<C-l>","<Right>",{ silent = true, noremap = true, desc="Move cursor right." })

-- Terminal contorls
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
