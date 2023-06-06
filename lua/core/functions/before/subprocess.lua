
NvimSubProcesses = NvimSubProcesses or {
  index = 0,
  processes = {}
}

local debug_enabled = false

local _debug = function(raw_message)
  if debug_enabled then
    Debug(raw_message)
  end
end


local send_lines_to_buffer = function (buffer, lines)
  local current_lines = vim.api.nvim_buf_line_count(buffer)
  if current_lines == 1 then
    -- We check if there is nothing in the buffer
    local content = vim.api.nvim_buf_get_lines(buffer, 0, 1, false)
    if content[1] == "" then
      current_lines = 0
    end
  end

  vim.api.nvim_buf_set_option(buffer, "modifiable", true)
  vim.api.nvim_buf_set_lines( buffer, current_lines, -1, false, lines)
  vim.api.nvim_buf_set_option(buffer, "modifiable", false)
end


---Starts a system process async
---@param command string
---@param args table
---@return number
local job_async_start = function (buffer, details)
  _debug("Async job starting")

  local output_to_buffer = function(_, data, _)
      send_lines_to_buffer(buffer, data)
  end

  local command = details.command
  local cwd = details.cwd or vim.loop.cwd()

  local job_id = vim.fn.jobstart(command, {
    on_stdout = output_to_buffer,
    on_stderr = output_to_buffer,
    stdout_bufferred = true,
    stderr_bufferred = true,
    env = details.env,
    cwd = cwd
  })

  _debug("Job id: " .. job_id)
  _debug("Async job started")

  return job_id
end


local buffer_start = function (details)
  _debug("Buffer starting")

  NvimSubProcesses.index = NvimSubProcesses.index + 1
  local buffer_name = " "

  if details.name ~= nil then
    buffer_name = buffer_name .. details.name .. " " .. NvimSubProcesses.index
  else
    buffer_name = buffer_name .. NvimSubProcesses.index
  end

  _debug("Buffer name: " .. buffer_name)

  -- We first start an unmodifiable buffer
  local process_buffer = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_option(process_buffer, "modifiable", false)
  vim.api.nvim_buf_set_name(process_buffer, buffer_name)

  -- table.insert(NvimSubProcesses.buffers, process_buffer)

  _debug("Buffer started")

  return process_buffer
end


local subprocess_start = function (details)
  _debug("Starting subprocess: " .. details.command[1])

  local process_buffer = buffer_start(details)
  -- TODO: check return value
  local job_id = job_async_start(process_buffer, details)
  table.insert(NvimSubProcesses.processes, {
    job_id = job_id,
    buffer = process_buffer
  })
end


local subprocess_stop = function (job_id)
  vim.fn.jobstop(job_id)
  -- Close all buffers linked to the subprocesses
  for id, process in ipairs(NvimSubProcesses.processes) do
    if process.job_id == job_id then
      vim.api.nvim_buf_delete(process.buffer, {})
      NvimSubProcesses.processes[id] = nil
    end
  end

  -- Resetting the buffers list
end


local subprocess_stop_all = function ()
  -- Close all buffers linked to the subprocesses
  for _, process in ipairs(NvimSubProcesses.processes) do
    vim.fn.jobstop(process.job_id)
    vim.api.nvim_buf_delete(process.buffer, {})
  end

  -- Resetting the buffers list
  NvimSubProcesses.processes = {}
end


SubprocessStart = subprocess_start


vim.api.nvim_create_user_command(
  "TestSubprocessStart",
  function (_)
    subprocess_start({
      name = "testcommand",
      command = {"pwd"},
      env = {apple="banana"},
      cwd = "/Users/neo/Desktop/"
    })
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  "SubprocesStopAll",
  function (_)
    subprocess_stop_all()
  end,
  { nargs = 0 }
)
