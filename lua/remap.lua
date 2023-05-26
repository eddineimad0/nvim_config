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

-- Fast save, quit and force quit.
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>",opt)
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>",opt)

-- Copy all.
vim.keymap.set("n", "<C-a>", "<CMD> %y+ <CR>",opt)

-- Buffer.
vim.keymap.set("n", "<leader>nb", "<CMD> enew <CR>",opt)
vim.keymap.set("n","<TAB>","<CMD>bnext<CR>",opt)
vim.keymap.set("n","<S-TAB>","<CMD>bprevious<CR>",opt)

-- Windows.
vim.keymap.set("n", ";b", "<CMD>enew<CR>",opt)
vim.keymap.set("n", ";h", "<CMD>split<CR>",opt)
vim.keymap.set("n", ";v", "<CMD>vsplit<CR>",opt)

-- Windows Navigation.
vim.keymap.set('n',"<C-h>", '<C-w>h',opt)
vim.keymap.set('n',"<C-l>", '<C-w>l',opt)
vim.keymap.set('n',"<C-j>", '<C-w>j',opt)
vim.keymap.set('n',"<C-k>", '<C-w>k',opt)

-- Windows Resize.
vim.keymap.set("n", "<C-Left>", "<C-w><",opt)
vim.keymap.set("n", "<C-Right>", "<C-w>>",opt)
vim.keymap.set("n", "<C-Up>", "<C-w>+",opt)
vim.keymap.set("n", "<C-Down>", "<C-w>-",opt)

-- Terminal
vim.keymap.set("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>",opt)
vim.keymap.set("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>",opt)


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
