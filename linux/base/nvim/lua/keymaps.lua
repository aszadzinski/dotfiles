local opts = { noremap = true, silent = true }


-- ####################################################
-- General
-- ####################################################
vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree<cr>", opts)
vim.keymap.set("n", "<C-f>", ":%s/")
vim.keymap.set("n", "<C-s>", ":AsyncRun ")

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


-- ####################################################
-- GIT
-- ####################################################
vim.keymap.set('n', '<leader>hc', require('telescope.builtin').git_commits, opts)
vim.keymap.set('n', '<leader>hg', require('telescope.builtin').git_branches, opts)
vim.keymap.set('n', '<leader>hf', require('telescope.builtin').git_files, opts)
vim.keymap.set('n', '<leader>hh', require("gitsigns").preview_hunk, opts)
vim.keymap.set('n', '<leader>hb', function()
		  require("gitsigns").blame_line { full = true }
end, opts)
vim.keymap.set("n", "]h", function()
		  if vim.wo.diff then
					 return "]h"
		  end
		  vim.schedule(function()
					 require("gitsigns").next_hunk()
		  end)
		  return "<Ignore>"
end, { expr = true, desc = "next hunk" })
vim.keymap.set("n", "[h", function()
		  if vim.wo.diff then
					 return "[h"
		  end
		  vim.schedule(function()
					 require("gitsigns").prev_hunk()
		  end)
		  return "<Ignore>"
end, { expr = true, desc = "previous hunk" })
-- vim.keymap.set('n', '<leader>hl', require("gitsigns").preview_hunk, opts)
-- vim.keymap.set('n', '<leader>ha', require("gitsigns").preview_hunk, opts)


-- ####################################################
-- Telescope
-- ####################################################
vim.keymap.set('n', '<leader>?', function()
		require('telescope.builtin').live_grep()
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
		require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				-- previewer = false,
		})
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').lsp_document_symbols, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })


-- ####################################################
-- LSP
-- ####################################################
lsp_keymaps = function(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }

        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
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
