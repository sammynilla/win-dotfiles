
-- Plugin: wilder
-- https://github.com/gelguy/wilder

local wilder = require("wilder")

wilder.setup({
  modes = { ":", "/", "?" },
  -- enable_cmdline_enter = 1,
})

wilder.set_option("renderer", wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  left = { " ", nil }, right = { " ", nil },
  max_height = vim.o.pumheight,
}))

