-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local opt = {silent = false, noremap = true}

-- Alternative to Alt-Up and Alt-Down in vscode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",{silent = true, noremap = true})
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv",{silent = true, noremap = true})

-- Fast search
vim.keymap.set("n", ";s", "/",opt)
-- Fast save,quit and force quit
vim.keymap.set("n", ";w", ":w<CR>",{silent = true, noremap = true})
vim.keymap.set("n", ";q", ":wq<CR>",{silent = true, noremap = true})
vim.keymap.set("n", ";Q", ":q!<CR>",{silent = true, noremap = true})

-- Remap CTRL-c to <esc>
vim.keymap.set({"n","i","v","o"}, "<C-c>","<esc>",opt)

vim.keymap.set('n','[d',vim.diagnostic.goto_prev,opts)
vim.keymap.set('n',']d',vim.diagnostic.goto_next,opts)

-- Remap CTRL-{h,j,k,l} to arrows in insert mode
vim.keymap.set("i","<C-h>","<Left>",opt)
vim.keymap.set("i","<C-j>","<Down>",opt)
vim.keymap.set("i","<C-k>","<Up>",opt)
vim.keymap.set("i","<C-l>","<Right>",opt)
