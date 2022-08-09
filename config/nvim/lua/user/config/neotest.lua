local M = {}

function M.setup()
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = true },
        runner = "pytest",
      },
      require "neotest-jest",
      require "neotest-go",
      require "neotest-plenary",
      require("neotest-vim-test")({ allow_file_types = { "haskell", "elixir" } }),
    },
  }
end

return M
