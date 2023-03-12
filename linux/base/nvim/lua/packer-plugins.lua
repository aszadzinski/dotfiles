return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'gruvbox-community/gruvbox'
--	use 'romgrk/barbar.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-lua/plenary.nvim'
--	use 'kyazdani42/nvim-web-devicons'
	use 'MunifTanjim/nui.nvim'
	use 'nvim-neo-tree/neo-tree.nvim'
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
end)
