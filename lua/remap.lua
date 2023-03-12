--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = {silent = true, noremap = true}

------------------ Normal Mode --------------------------------------------------

-- Remap for dealing with word wrap.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, noremap = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, noremap = true })
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, noremap = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, noremap = true })

-- Switch between windows.
vim.keymap.set('n',"<C-h>", '<C-w>h',opt)
vim.keymap.set('n',"<C-l>", '<C-w>l',opt)
vim.keymap.set('n',"<C-j>", '<C-w>j',opt)
vim.keymap.set('n',"<C-k>", '<C-w>k',opt)

-- Fast search.
vim.keymap.set("n", ";s", "/",opt)
-- Fast save, quit and force quit.
vim.keymap.set("n", ";w", ":w<CR>",opt)
vim.keymap.set("n", ";q", ":wq<CR>",opt)
vim.keymap.set("n", ";Q", ":q!<CR>",opt)

-- Copy all.
vim.keymap.set("n", "<C-a>", "<cmd> %y+ <CR>",opt)

-- New Buffer.
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>",opt)

vim.keymap.set('n','[d',vim.diagnostic.goto_prev,opts)
vim.keymap.set('n',']d',vim.diagnostic.goto_next,opts)

---------------- Insert Mode --------------------------

-- Remap CTRL-{h,j,k,l} to arrows in insert mode for better navigation.
vim.keymap.set("i","<C-h>","<Left>",opt)
vim.keymap.set("i","<C-j>","<Down>",opt)
vim.keymap.set("i","<C-k>","<Up>",opt)
vim.keymap.set("i","<C-l>","<Right>",opt)

-- Goto begining and end of line.
vim.keymap.set("i","<C-b>","<ESC>^i",opt)
vim.keymap.set("i","<C-e>","<End>",opt)

--------------- Visual Mode ---------------------------
-- Alternative to Alt-Up and Alt-Down in vscode.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",opt)
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv",opt)

vim.keymap.set('v', 'j', "v:count || mode(1)[0:1] == 'no' ? 'gj' : 'j'", { expr = true, silent = true, noremap = true })
vim.keymap.set('v', 'k', "v:count || mode(1)[0:1] == 'no' ? 'gk' : 'k'", { expr = true, silent = true, noremap = true })

--------------- X -----------------------------------

vim.keymap.set('x', 'j', "v:count || mode(1)[0:1] == 'no' ? 'gj' : 'j'", { expr = true, silent = true, noremap = true })
vim.keymap.set('x', 'k', "v:count || mode(1)[0:1] == 'no' ? 'gk' : 'k'", { expr = true, silent = true, noremap = true })
vim.keymap.set('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', opt)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
