-- setup optional setting flags for neovim setup
-- load this first as the following configs can depend on these global settings
require("settings")

-- setup any vanilla neovim options
require("configs.core")

-- load the plugin manager, lazy
require("plugin-manager")

-- setup any lsp settings
require("configs.lsp")

-- setup any dap settings
require("configs.dap")
