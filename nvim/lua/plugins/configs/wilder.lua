local wilder = require("wilder")

wilder.setup({ modes = { ":" }, enable_cmdline_enter = 1, })

-- TODO: build something to generate a list of excluded directory/file paths
wilder.set_option("pipeline", {
  wilder.branch(
    wilder.python_file_finder_pipeline({
      file_command = function(ctx, arg)
        if string.find(arg, ".") ~= nil then
          return { "fd", "-tf", "-H", "-E**/.git/*", "-E**/node_modules/**" }
        else
          return { "fd", "-tf", "-E**/node_modules/**", }
        end
      end,
      dir_command = { "fd", "-td" },
      --[[ cpsm is supposed to be better for performance, but I haven"t felt the
           need for it yet. ]]--
      -- filters = { "cpsm_filter" },
      filters = { "fuzzy_filter", "difflib_sorter", },
    }),
    wilder.cmdline_pipeline({
      fuzzy = 2,
      fuzzy_filter = wilder.lua_fzy_filter(),
    })
  )
})

wilder.set_option("renderer", wilder.renderer_mux({
  [":"] = wilder.popupmenu_renderer({
    highlighter = wilder.lua_fzy_highlighter(), 
    -- NOTE: wilder color fuzzy finder accent (before selection underline)
    -- highlights = {
    --   accent = wilder.make_hl("WilderAccent", "Pmenu", {
    --     {a = 1}, {a = 1}, {foreground = "#f4468f"}
    --   }),
    -- },
    -- left = { " ", nil }, right = { " ", nil },
    max_height = vim.o.pumheight,
  }),
}))
