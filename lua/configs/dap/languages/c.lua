local dap = require('dap')


local codelldb = require("configs.dap.paths").get_exec_path("codelldb")


dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb,
    args = { "--port", "${port}" },
  }
}
