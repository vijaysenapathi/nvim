local dap_details = require("core.plugins.configs.dap.base")
local dap = dap_details.dap
local dap_adapter = dap_details.adapter


local debugpy_adapter = dap_adapter("debugpy-adapter")

--- Setups up python debugging
--- @param debug_config table
local debug_python = function (debug_config)
  dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
      local port = (config.connect or config).port
      local host = (config.connect or config).host or '127.0.0.1'
      cb({
        type = 'server',
        port = assert(port, '`connect.port` is required for a python `attach` configuration'),
        host = host,
        options = {
          source_filetype = 'python',
        },
      })
    else
      cb({
        type = 'executable',
        command = debugpy_adapter,
        -- command = 'path/to/virtualenvs/debugpy/bin/python',
        -- args = { '-m', 'debugpy.adapter' },
        args = {},
        options = {
          source_filetype = 'python',
        },
      })
    end
  end

  dap.configurations.python = {
    {
      -- The first three options are required by nvim-dap
      type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch';
      name = "Launch file";

      program = "${file}"; -- This configuration will launch the current file if used.
      pythonPath = function()
        return debug_config.python_path
      end;
      args = { "runserver" },
      env = { yolo="apple" }
    }
  }
end


DebugPython = debug_python
