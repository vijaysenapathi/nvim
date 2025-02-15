-- set leader keys before setting keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- TODO: add good pneomonic descriptions in all of the following

-- keymaps related to navigation
require("configs.core.keymaps.navigation")

-- keymaps related to command mode
require("configs.core.keymaps.cmdmode")

-- all keymaps related to searching
require("configs.core.keymaps.search")

-- all keymaps related to diagnostics
require("configs.core.keymaps.diagnostics")

-- other keymaps
require("configs.core.keymaps.misc")
