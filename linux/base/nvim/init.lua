vim.g.mapleader = " "
vim.o.relativenumber = true
vim.o.number = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.smartindent = true
vim.o.errorbells = false
vim.o.scrolloff = 8
vim.o.incsearch = true

vim.o.tabstop = 4
vim.o.softtabstop = 4

vim.g.noswapfiles = true -- :D
vim.g.nobackup = true -- :D
vim.g.signcolumn = "yes"

require('packer-plugins')
require('user.keymaps')
require('user.nvim-tree')
require('user.colors')
require("mason").setup()
