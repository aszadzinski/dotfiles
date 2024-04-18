local coq = require("coq")
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
			"clangd",
			"lua_ls",
			"ltex",
	}
})

-- local lsp_flags = {
--   -- This is the default in Nvim 0.7+
--   debounce_text_changes = 150,
-- }
require("lspconfig")["pylsp"].setup(coq.lsp_ensure_capabilities({
    on_attach = lsp_keymaps,
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
									'D101',
									'D102',
									'D103',
									'D107',
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
}))

require("lspconfig")["taplo"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
require("lspconfig")["volar"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
require("lspconfig")["yamlls"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
require("lspconfig")["bashls"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
require("lspconfig")["dockerls"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
require("lspconfig")["cmake"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
require("lspconfig")["html"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
require("lspconfig")["tailwindcss"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))

require("lspconfig")["clangd"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
require("lspconfig")["ltex"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
require("lspconfig")["lua_ls"].setup(coq.lsp_ensure_capabilities({
		on_attach = lsp_keymaps,
}))
