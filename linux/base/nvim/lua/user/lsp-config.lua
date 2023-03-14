require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
			"pylsp",
			"dockerls",
			"taplo",
			"volar",
			"cmake",
			"tailwindcss",
			"html",
	}
})


local on_lsp_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>la', vim.lsp.buf.format, bufopts)
  vim.keymap.set('n', 'gr',require('telescope.builtin').lsp_references , bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
-- local lsp_flags = {
--   -- This is the default in Nvim 0.7+
--   debounce_text_changes = 150,
-- }
require("lspconfig")["pylsp"].setup {
    on_attach = on_lsp_attach,
    settings = {
        pylsp = {
            plugins = {
					autopep8 = {
							enabled = true,
					},
					flake8 = {
							enabled = false,
					},
					pydocstyle = {
							enabled = true,
							ignore = {
									'D100',
									'D203',
									'D213',
							},
					},
					pycodestyle = {
							ignore = {
									'E203',
									'W503',
									'W605',
							},
							maxLineLength = 140,
					}
			},
		}
	},
}

require("lspconfig")["taplo"].setup {
		on_attach = on_lsp_attach,
}
require("lspconfig")["volar"].setup {
		on_attach = on_lsp_attach,
}
require("lspconfig")["yamlls"].setup {
		on_attach = on_lsp_attach,
}
require("lspconfig")["bashls"].setup {
		on_attach = on_lsp_attach,
}
require("lspconfig")["dockerls"].setup {
		on_attach = on_lsp_attach,
}
require("lspconfig")["cmake"].setup {
		on_attach = on_lsp_attach,
}
require("lspconfig")["html"].setup {
		on_attach = on_lsp_attach,
}
require("lspconfig")["tailwindcss"].setup {
		on_attach = on_lsp_attach,
}

if jit.arch ~= "arm64" then
		require("mason-lspconfig").setup({
			ensure_installed = {
					"clangd",
					"lua_ls",
					"ltex",
			}
		})
		
		require("lspconfig")["clangd"].setup {
				on_attach = on_lsp_attach,
		}
		require("lspconfig")["ltex"].setup {
				on_attach = on_lsp_attach,
		}
		require("lspconfig")["lua_ls"].setup {
				on_attach = on_lsp_attach,
		}
else
		print("Can't install some LSP packages. Unsupported system architecture")
end

