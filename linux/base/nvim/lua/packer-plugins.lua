return require("packer").startup(function()
		-- tools
		use "lewis6991/impatient.nvim"
		use "wbthomason/packer.nvim"

		-- Looks
		use "nvim-tree/nvim-web-devicons"
		use "yamatsum/nvim-cursorline"
		use "gruvbox-community/gruvbox"
		use "MunifTanjim/nui.nvim"
		use {
				"nvim-treesitter/nvim-treesitter",
				run = function()
						local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
						ts_update()
				end,
		}
		use {
				  "nvim-lualine/lualine.nvim",
				  requires = { "kyazdani42/nvim-web-devicons", opt = true }
		}

		-- managers
		use "nvim-neo-tree/neo-tree.nvim"
		use {
				"lewis6991/gitsigns.nvim",
		}

		use {
				"nvim-telescope/telescope.nvim",
				requires = {
						"nvim-lua/plenary.nvim",
				},
		}

		-- IDE
		use "skywind3000/asyncrun.vim"
		use {
			"ms-jpq/coq_nvim",
			requires = {
				--"ms-jpq/coq.artifacts",
				--"ms-jpq/coq.thirdparty"
			},
		}
		use {
				"williamboman/mason.nvim",
				requires = {
						"neovim/nvim-lspconfig",
						"williamboman/mason-lspconfig.nvim",
						"j-hui/fidget.nvim",
				},
		}
		use {
				"hrsh7th/nvim-cmp",
				requires = {
						"hrsh7th/cmp-nvim-lsp",
						"L3MON4D3/LuaSnip",
						"saadparwaiz1/cmp_luasnip",
				},
		}

		-- Debugging
		use "mfussenegger/nvim-dap"

end)
