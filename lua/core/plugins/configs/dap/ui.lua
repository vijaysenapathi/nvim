local dapui = require("dapui")
dapui.setup()

local dapui_open = function ()
  dapui.open()
end

local dapui_close = function ()
  dapui.close()
end

local dapui_toggle = function ()
  dapui.toggle()
end


vim.api.nvim_create_user_command("DUOpen", function (_) dapui_open() end, { nargs = 0 })
vim.api.nvim_create_user_command("DUClose", function (_) dapui_close() end, { nargs = 0 })
vim.api.nvim_create_user_command("DUToggle", function (_) dapui_toggle() end, { nargs = 0 })

