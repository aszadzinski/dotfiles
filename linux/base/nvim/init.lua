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
require('user.lsp-config')
require('user.telescope')

_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}
require('impatient')
