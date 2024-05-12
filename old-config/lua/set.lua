local opt = vim.opt
local g = vim.g

-- No highlight on search
opt.hlsearch = false
opt.incsearch = true

-- line numbers 
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
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
