-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme nordfox]]

require('nightfox').setup({
  options = {
    transparent = true
  }
})

require("colorizer").setup {
  tailwind = true, -- Enable tailwind colors
}

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'nordfox',
    component_separators = '|',
    section_separators = '',
  },
}

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

