local dap_details = require("core.plugins.configs.dap.base")
local dap = dap_details.dap


local dap_breakpoint = function ()
  dap.toggle_breakpoint()
end


local dap_continue = function()
  dap.continue()
end


local dap_step_into = function ()
  dap.dap_step_into()
end


local dap_step_over = function ()
  dap.dap_step_over()
end


local dap_debug_console = function ()
  dap.repl.open()
end


-- Creating vim commands
vim.api.nvim_create_user_command(
  "Breakpoint",
  function (_)
    dap_breakpoint()
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  "Continue",
  function (_)
    dap_continue()
  end,
  { nargs = 0 }
)


vim.api.nvim_create_user_command(
  "StepInto",
  function (_)
    dap_step_into()
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  "StepOver",
  function (_)
    dap_step_over()
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  "DebugConsole",
  function (_)
    dap_debug_console()
  end,
  { nargs = 0 }
)

