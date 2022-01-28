local status_ok, npairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

npairs.setup({
  enable_check_bracket_line = true,
})
