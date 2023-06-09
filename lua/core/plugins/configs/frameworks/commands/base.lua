
local function run_command(name, command, details)
  details = details or {}
  local command_args = details.args or {}

  local run_subprocess = function()
    SubprocessStart({
      name = name,
      command = {
        command,
        unpack(command_args)
      },
      env = details.env or { editor = "nvim" },
      cwd = details.wd or vim.fn.getcwd()
    })
  end

  -- This will set global commands here
  -- name = run_subprocess

  vim.api.nvim_create_user_command(
    name,
    function (_)
      run_subprocess()
    end,
    { nargs = 0 }
  )
end

RunCommand = run_command

