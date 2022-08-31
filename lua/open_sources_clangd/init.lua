local M = {}

vim.api.nvim_create_user_command('OpenHCpp', "lua require('open_sources_clangd').open()", {})

function M.open()
  -- get current buffer number for later
  local buf_name = vim.api.nvim_buf_get_name(0)
  local split = M.split(buf_name, "/")
  buf_name = split[#split]
  vim.cmd('ClangdSwitchSourceHeader')
  vim.cmd('vert sb ' .. buf_name)
end


function M.split(string, sep)

  -- if no separator is given then defaults to whitespace
  if sep == nil then
    sep = "%s"
  end

  local split = {}

  -- get the substrings separated by the separator
  for i in string.gmatch(string, "([^"..sep.."]+)") do
    table.insert(split, i)
  end

  return split
end

return M
