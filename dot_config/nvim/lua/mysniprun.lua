require'sniprun'.setup({
  repl_enable = { "Python3_original", "Julia_original" },
  display = {  
    "NvimNotify",
    "Classic"
    -- "TerminalWithCode" 
  },
  interpreter_options = {
    R_original = {
      use_on_filetypes = {"quarto"}
    }
  }
})

local wk = require('which-key')
wk.register({
  ['<leader>r'] = { ":SnipRun<CR>" , "[R]un snippet" }
})

