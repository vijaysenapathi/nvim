require("mason-nvim-dap").setup({
  ensure_installed = {
    "python" -- debugpy
  }
})

local adapters_path = PathJoin(vim.fn.stdpath("data"), "mason", "bin")
--- Fetches given debug adapter from mason installs
--- @param adapter_name string The name of the debug adapter
local dap_get_adapter = function(adapter_name)
  return PathJoin(adapter_name)
end

local dap = require('dap')

return {
  dap = dap,
  adapter = dap_get_adapter
}
