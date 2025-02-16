
---@param exec_name string
local get_exec_path = function (exec_name)
  -- this is the default path where mason puts its downloaded executables
  local data_path = vim.fn.stdpath("data")
  if type(data_path) == "table" then
    data_path = data_path[1]
  end
  return vim.fs.joinpath(vim.fn.stdpath("data"), "mason", exec_name)
end


return {
  get_exec_path = get_exec_path
}
