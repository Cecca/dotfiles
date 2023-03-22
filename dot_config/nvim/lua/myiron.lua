local iron = require("iron.core")

iron.setup {
  config = {
    scratch_repl = true,
    repl_definition = {
      R = {
        command = {"radian"}
      },
      quarto = {
        command = {"radian"}
      }
    }
  },
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
}

