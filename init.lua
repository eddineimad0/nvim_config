-- Space is our leader, must happen before loading plugins.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

-- Misc
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.mouse = "a" -- Enable mouse mode

-- Show which line your cursor is on
opt.cursorline = true
opt.conceallevel = 2 -- Hide * markup for bold and italic
opt.spelllang = { "en" }
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- line numbers 
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.numberwidth = 2
opt.colorcolumn = "80"

-- Indenting
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.smartindent = true -- Insert indents automatically
opt.expandtab = true -- Use spaces instead of tabs
opt.softtabstop = 4
opt.breakindent = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.whichwrap:append "<>[]hl"
opt.scrolloff = 10 -- Lines of context
opt.sidescrolloff = 8 -- Horizontal Lines of context

-- Window splits
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.splitkeep = "screen"
opt.winminwidth = 5 -- Minimum window width

-- History
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 250 -- Save swap file and trigger CursorHold

-- Completion
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.completeopt = "menu,menuone,noselect" -- Better completion experience
opt.inccommand = "nosplit" --preview incremental substitute
opt.wrap = false -- Disable line wrap
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

if vim.fn.has("win32") == 1 then
    require("utils").setup_shell("powershell")
end


-- Folding
opt.foldlevel = 99
opt.foldcolumn = "1"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99
opt.foldenable = true


-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- disable calls to zig fmt on save (very laggy).
vim.g.zig_fmt_autosave = 0

-- UI
opt.laststatus = 3
opt.showmode = false -- Dont show mode since we have a statusline
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.background = "dark"

require("plugin")
require("config")

vim.cmd("colorscheme gruvbox")
