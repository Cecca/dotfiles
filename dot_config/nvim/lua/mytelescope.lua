-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      previewer = false,
      theme = 'dropdown'
    }
  }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local telebuiltin = require('telescope.builtin')
local wk = require('which-key')

-- See `:help telescope.builtin`
wk.register({
  ['<space>'] = { telebuiltin.buffers, 'Search buffers'},
}, { prefix = '<leader>' })

wk.register({
  name = 'Search',
  f = { telebuiltin.find_files, 'Search files' },
  h = { telebuiltin.help_tags, 'Search help' },
  w = { telebuiltin.grep_string, 'Search current [W]ord' },
  g = { telebuiltin.grep, 'Search by [G]rep' },
  d = { telebuiltin.diagnostics, 'Search [D]iagnostics' },
}, { prefix = '<leader>s' })

