local M = {}

local function configure()
  local dap_breakpoint = {
    error = {
      text = "🟥",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "⭐️",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
  require("nvim-dap-virtual-text").setup {
    commented = true,
  }

  local dap, dapui = require "dap", require "dapui"
  dapui.setup {} -- use default
  -- Opens automatically dap-ui
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { os.getenv "HOME" .. "/dap/vscode-chrome-debug/out/src/chromeDebug.js" },
  }

  dap.configurations.javascript = {
      {
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd() .. '/src',
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}"
      }
  }
  dap.configurations.javascriptreact = {
      {
          type = "chrome",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}"
      }
  }
end

local function configure_debuggers()
  require("user.config.dap.python").setup()
end

function M.setup()
  configure()
  configure_exts()
  configure_debuggers()
end

return M
