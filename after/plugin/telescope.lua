require('telescope').setup {
	defaults = {
	  mappings = {
		i = {
		  ['<C-u>'] = false,
		  ['<C-d>'] = false,
		},
	  },
	},
}
  
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Keymaps  
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[F]ind existing buffers' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').git_status, { desc = '[F]ind git [S]tatus' })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').git_commits, { desc = '[F]ind git [C]ommits' })
vim.keymap.set('n', '<leader>/', function()
require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  winblend = 10,
  previewer = false,
})
end, { desc = '[/] Fuzzily search in current buffer]' })

