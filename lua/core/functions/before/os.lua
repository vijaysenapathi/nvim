local os_name = vim.loop.os_uname().sysname


local os_is_windows = function ()
  -- TODO: handle linux and windows
  return false
end


local os_is_unix = function ()
  -- TODO: handle linux
  return true
end


IsWindows = os_is_windows()
IsUnix = os_is_unix()
