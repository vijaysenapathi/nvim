--[[
local hello = function (message)
  print(message)
end

-- Debug(vim.treesitter)
local parser = vim.treesitter.get_parser()
if parser ~= nil then
  local tree = parser:parse()
  local node = tree[1]:root()
  Debug(vim.treesitter.get_node_text(node, 0))
  Debug(vim.treesitter.query.list_directives())
  Debug(vim.treesitter.query.list_predicates())
end
]]

--[[
local structure_open = function ()

end


StructureOpen = structure_open


-- Creating a vim command
vim.api.nvim_create_user_command(
  "StructureOpen",
  function (_)
    structure_open()
  end,
  { nargs = 0 }
)
]]
