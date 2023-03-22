local wk = require('which-key')
wk.setup {
  --
}

-- Diagnostic keymaps
wk.register({
  ['[d'] = {vim.diagnostic.goto_prev, "Go to previous diagnostic"},
  [']d'] = {vim.diagnostic.goto_next, "Go to next diagnostic"},
  ['<leader>?'] = {vim.diagnostic.open_float, "Open diagnostics float window"},
  ['<leader>m'] = {":make<CR>", "[M]ake"},
})

