local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    require("plugin.treesitter"),
    require("plugin.colorscheme"),
    require("plugin.code"),
    require("plugin.ui"),
    require("plugin.misc"),
    require("plugin.editor"),
    require("plugin.lsp"),
}

require("lazy").setup(plugins)
