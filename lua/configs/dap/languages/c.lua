local dap = require("dap")

dap.adapters.lldb = {
  type = "executable",
}


local logger = require("debug-tools").logger

logger:info("hello logger from debug tools")
