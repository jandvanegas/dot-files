local M = {}

function M.setup()
  local neotest = require("neotest")
  neotest.setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
        runner = "pytest",
      },
      require "neotest-jest",
      require "neotest-go",
      require "neotest-plenary",
      require("neotest-vim-test")({
        allow_file_types = { "haskell", "elixir" },
      }),
    },
    discovery = {
      enabled = true
    },
    diagnostic = {
      enabled = false
    }
  }
end

return M
