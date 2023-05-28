require("mason-nvim-dap").setup({
  ensure_installed = {
    "python" -- debugpy
  }
})

local adapters_path = PathJoin(vim.fn.stdpath("data"), "mason", "bin")
--- Fetches given debug adapter from mason installs
--- @param adapter_name string The name of the debug adapter
local dap_get_adapter = function(adapter_name)
  return PathJoin(adapters_path, adapter_name)
end

local dap = require('dap')


vim.api.nvim_set_hl(0, "DebugBreakpoint", {
  fg = "#ED8796",  -- Red
})

vim.api.nvim_set_hl(0, "DebugBreakpointLine", {
  fg = "#363A4F", -- Dark
  bg = "#EED49F"  -- Yellow
})


-- Defining signs for debugging
vim.fn.sign_define('DapBreakpoint', {text='', texthl='DebugBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='DebugBreakpointLine', linehl='DebugBreakpointLine', numhl='DebugBreakpointLine'})


return {
  dap = dap,
  adapter = dap_get_adapter
}
