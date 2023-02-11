-- [[ Various Configs ]]

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'gruvbox',
      component_separators = '|',
      section_separators = '',
    },
  }

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}