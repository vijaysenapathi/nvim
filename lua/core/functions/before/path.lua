local path_seperator = IsWindows and "\\" or "/"

local path_join = function (...)
  local args = {...}
  local full_path = ""
  for _,v in ipairs(args) do
    if full_path ~= "" then
      full_path = full_path .. path_seperator .. tostring(v)
    else
      full_path = tostring(v)
    end
  end
  return full_path
end

PathJoin = path_join

return {
  path_join = path_join
}
