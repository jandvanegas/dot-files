local M = {}

function M.setup(_)
  local dap_python = require("dap-python")
  dap_python.setup("python", {
    opts = {
      console = "externalTerminal"
    }
  })
  dap_python.test_runner = 'pytest'

  end

return M
