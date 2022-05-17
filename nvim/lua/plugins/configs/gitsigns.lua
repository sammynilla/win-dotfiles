local function get_count_chars()
  local chars = { [1] = " ", ['+'] = ">", }
  for index = 2,9 do
    chars[index] = tostring(index)
  end
  return chars
end

local function create_sign_conf(alias, show_count)
  local hl = "GitSigns"..alias
  local conf = { hl = hl, text = "│", numhl = hl.."Nr", linehl = hl.."Ln", }

  if (type(show_count) == "boolean") then
    if show_count ~= nil then
      conf.show_count = show_count
    else
      conf.show_count = false
    end
  end
  return conf
end

require("gitsigns").setup({
  count_chars = get_count_chars(),
  signs = {
    add = create_sign_conf("Add"),
    change = create_sign_conf("Change"),
    delete = create_sign_conf("Delete", true),
    topdelete = create_sign_conf("Delete", true),
    changedelete = create_sign_conf("Change"),
  },
})
