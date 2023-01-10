local lsp = require('lsp-zero')

lsp.preset('recommended')

local servers = {"clangd","rust_analyzer"}

lsp.ensure_installed(servers)


local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- Disable the horrific signs
lsp.set_preferences({
	sign_icons = {}
})

 lsp.setup_nvim_cmp({
	mapping = cmp_mappings
 })

 lsp.on_attach(function(client,bufnr)
	local opts = {buffer = bufnr, remap = false}

    -- Mappings
 	vim.keymap.set("n","gd",function() vim.lsp.buf.definition() end,opts)
 	vim.keymap.set("n","K",function() vim.lsp.buf.hover() end,opts)
 	vim.keymap.set("n","<leader>ws",function() vim.lsp.buf.workspace_symbol() end,opts)
 	vim.keymap.set("n","<leader>vd",function() vim.diagnositc.open_float() end,opts)
 	vim.keymap.set("n","[d",function() vim.diagnositc.goto_next() end,opts)
 	vim.keymap.set("n","]d",function() vim.diagnositc.goto_prev() end,opts)
 	vim.keymap.set("n","<leader>ca",function() vim.lsp.buf.code_action() end,opts)
 	vim.keymap.set("n","<leader>vrr",function() vim.lsp.buf.references() end,opts)
 	vim.keymap.set("n","<leader>vrn",function() vim.lsp.buf.rename() end,opts)
 	vim.keymap.set("i","<C-g>",function() vim.lsp.buf.signature_help() end,opts)
 end)

require("lspconfig").clangd.setup{
    on_attach = lsp.on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--all-scopes-completion",
        "--pretty",
        "--header-insertion=never",
        "-j=4",
        "--inlay-hints",
        "--header-insertion-decorators",
    },
    filetypes = {"c","cpp"},
    init_option = { fallbackFlags = { "-std=c++2a" } }
}
lsp.setup()
