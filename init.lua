require("plugins")

-- space as leader.
vim.g.mapleader = " "

require("remap")

-- Colorscheme 
vim.g.gruvbox_contrast_dark="medium"
vim.g.gruvbox_contrast_light="hard"
vim.cmd [[colorscheme gruvbox]]
require("set")

