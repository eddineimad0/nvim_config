local opt = vim.opt
local g = vim.g

-- Set highlight on search
opt.hlsearch = false

-- line numbers 
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.breakindent = true

-- Enable mouse mode
opt.mouse = 'a'
-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

opt.whichwrap:append "<>[]hl"
opt.termguicolors = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
-- Save undo history
opt.undofile = true
-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 400

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

opt.scrolloff = 8

opt.relativenumber = true
opt.autoread = true

-- disble netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

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
