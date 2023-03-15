require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
		['<C-h>'] = require('telescope.actions').select_horizontal
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
