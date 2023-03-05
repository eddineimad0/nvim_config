require("nvim-tree").setup({
  sort_by = "case_sensitive",
  actions = {
    open_file = {quit_on_open = true }
  },
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    custom = {"^.git$"}
  },
  git = {
    enable = false,
  },
  log = {
    enable = true,
    types = {
      diagnostics = true,
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint='H',
      info ='I',
      warning='W',
      error='E',
    },
  }
})

-- Keymaps
vim.keymap.set('n','<C-e>','<cmd>NvimTreeToggle<CR>')
