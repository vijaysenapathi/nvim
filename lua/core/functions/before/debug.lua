local buffer_name = "nvim-debug.log"

local get_debug_details = function ()
  if _DebugDetails == nil then
    _DebugDetails = {
      buffer = vim.api.nvim_create_buf(true, true)
    }
    local debug_buffer = _DebugDetails.buffer
    vim.api.nvim_buf_set_option(debug_buffer, "modifiable", false)
    vim.api.nvim_buf_set_name(debug_buffer, buffer_name)
  end
  return _DebugDetails
end


local get_debug_window_if_open = function (buffer_full_name)
  local open_windows = vim.api.nvim_list_wins()
  for _, window in ipairs(open_windows) do
    local window_buffer = vim.api.nvim_win_get_buf(window)
    local window_buffer_name = vim.api.nvim_buf_get_name(window_buffer)
    if buffer_full_name == window_buffer_name then
      return window
    end
  end
  return nil
end


local get_debug_window = function (buffer)
  local buffer_full_name = vim.api.nvim_buf_get_name(buffer)
  local debug_window = get_debug_window_if_open(buffer_full_name)

  if debug_window == nil then
    vim.cmd("split")
    local current_window = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_height(current_window, 10)
    vim.api.nvim_win_set_buf(current_window, buffer)
    debug_window = get_debug_window_if_open(buffer_full_name)
  end

  return debug_window
end


local window_scroll_to_end = function (window)
  local current_window = vim.api.nvim_get_current_win()
  local current_window_position = vim.api.nvim_win_get_cursor(current_window)

  local buffer = vim.api.nvim_win_get_buf(window)
  local buffer_size = vim.api.nvim_buf_line_count(buffer)
  vim.api.nvim_win_set_cursor(window, {buffer_size, 0})

  if current_window == window then
    vim.api.nvim_win_set_cursor(current_window, current_window_position)
  end
end


--- logs a debug message
--- @param raw_message any
local debug = function (raw_message)
  local message = vim.inspect(raw_message)
  local debug_details = get_debug_details()
  local debug_buffer = debug_details.buffer

  local lines = {}
  local line_count = 0
  for line in string.gmatch(message, "[^\n]+") do
    table.insert(lines, line)
    line_count = line_count + 1
  end

  local current_lines = vim.api.nvim_buf_line_count(debug_buffer)
  if current_lines == 1 then
    -- We check if there is nothing in the buffer
    local content = vim.api.nvim_buf_get_lines(debug_buffer, 0, 1, false)
    if content[1] == "" then
      current_lines = 0
    end
  end

  vim.api.nvim_buf_set_option(debug_buffer, "modifiable", true)
  vim.api.nvim_buf_set_lines(
    debug_buffer, current_lines, -1, false, lines
  )
  vim.api.nvim_buf_set_option(debug_buffer, "modifiable", false)

  local debug_window = get_debug_window(debug_buffer)
  window_scroll_to_end(debug_window)
end


--- clears the debug buffer
local debug_clear = function ()
  local debug_details = get_debug_details()
  local debug_buffer = debug_details.buffer

  -- vim.api.nvim_buf_delete(debug_buffer, {})
  vim.api.nvim_buf_set_option(debug_buffer, "modifiable", true)
  vim.api.nvim_buf_set_lines(debug_buffer, 0, -1, false, {})
  vim.api.nvim_buf_set_option(debug_buffer, "modifiable", false)
end


Debug = debug
DebugClear = debug_clear


-- Creating a vim command
vim.api.nvim_create_user_command(
  "NvimDebug",
  function (opts)
    debug(opts.fargs[1])
  end,
  { nargs = 1 }
)

vim.api.nvim_create_user_command(
  "NvimDebugClear",
  function (_)
    debug_clear()
  end,
  { nargs = 0 }
)
