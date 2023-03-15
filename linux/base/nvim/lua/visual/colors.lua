vim.cmd("colorscheme gruvbox")

require('nvim-cursorline').setup {
	cursorline = {
		enable = true,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	}
}

require("nvim-treesitter.configs").setup {
		  ensure_installed = {
					 "python", "cpp", "lua", "vim", "c", "dockerfile",
					 "html", "json", "latex", "markdown", "toml", "vue",
					 "yaml", "make", "bash"
		  },
		  ignore_install = {},
		  highlight = {
					 enable = true,
					 disable = { 'help' },
		  },
}
