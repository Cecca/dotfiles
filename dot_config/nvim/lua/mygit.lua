-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[Neogit]]
local neogit = require('neogit')
neogit.setup{}

require('which-key').register({
  ['<leader>g'] = {'<cmd>Neogit<CR>', 'Open neogit'},
})


