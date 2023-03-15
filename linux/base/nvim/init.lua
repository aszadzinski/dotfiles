vim.g.mapleader = " "
vim.o.relativenumber = true
vim.o.number = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.smartindent = true
vim.o.errorbells = false
vim.o.scrolloff = 8
vim.o.incsearch = true
vim.o.cursorline = true
   
vim.o.colorcolumn = "130"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.g.noswapfiles = true -- :D
vim.g.nobackup = true -- :D
vim.g.signcolumn = "yes"

vim.g.asyncrun_open = 6

require('keymaps')
require('packer-plugins')
require('visual.colors')
require('visual.syntax')
require('visual.statusline')
require('managers.telescope')
require('managers.nvim-tree')
require('IDE.lsp-config')
require('IDE.snippets')
require('IDE.coq')
require('integrations.git-config')

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
