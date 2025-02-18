local dap = require('dap')


local codelldb = require("configs.dap.paths").get_exec_path("codelldb")


dap.adapters.c = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb,
    args = { "--port", "${port}" },
  }
}
