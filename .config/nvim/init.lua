-- Load Vim config
vim.cmd 'set runtimepath^=~/.vim runtimepath+=~/.vim/after'
vim.o.packpath = vim.o.runtimepath
vim.cmd 'source ~/.vimrc'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("core.plugins")
require("core.settings")
require("core.keymaps")
require("core.autocmds")
require("core.plugin_config")

vim.cmd('colorscheme jellybeans-nvim')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
