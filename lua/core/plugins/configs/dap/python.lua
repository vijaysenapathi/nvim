local dap_details = require("core.plugins.configs.dap.base")
local dap = dap_details.dap
local dap_adapter = dap_details.adapter


local debugpy_adapter = dap_adapter("debugpy-adapter")

--- Setups up python debugging
--- @param config table
local debug_python = function (config)
  dap.adapters.python = function(cb, adapter_config)
    if adapter_config.request == 'attach' then
      local port = (adapter_config.connect or adapter_config).port
      local host = (adapter_config.connect or adapter_config).host or '127.0.0.1'
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

  local pythonPath = config.python_path
  local env = config.env
  local cwd = config.cwd or "${workspaceFolder}"

  local configurations = {}
  for _, conf in ipairs(config.configurations) do
    table.insert(configurations, {
      -- The first three options are required by nvim-dap
      type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch';
      name = conf.name or "Unnamed";

      program = conf.program or "${file}"; -- This configuration will launch the current file if used.
      cwd = cwd,
      pythonPath = pythonPath,
      args = conf.args or {},
      env = env
    })

  end

  dap.configurations.python = configurations
  -- {
  --   -- The first three options are required by nvim-dap
  --   type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
  --   request = 'launch';
  --   name = config.name or "Unnamed";
  --
  --   program = config.program or "${file}"; -- This configuration will launch the current file if used.
  --   cwd = "${workspaceFolder}",
  --   pythonPath = function()
  --     return config.python_path
  --   end;
  --   args = config.args or {},
  --   env = config.env or {}
  -- }
end


DebugPython = debug_python
