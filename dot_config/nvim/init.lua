-- Automatically source and re-compile packer whenever you save this init.lua
-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'source <afile> | PackerCompile',
--   group = packer_group,
--   pattern = (vim.fn.expand '$HOME') .. '.config/nvim/?/?.lua',
-- })
--

require("mypacker")
require("mybasic")
require("mylook")
require("mykeys")
require("mytreesitter")
require("mytelescope")
require("mygit")
require("mytex")
require("mylsp")
require("mycmp")
-- require("myslime")
require("mysniprun")

require("perfanno").setup()

require("notify").setup({
  background_colour = "#000000",
})
vim.notify = require("notify")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
