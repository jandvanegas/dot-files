local M = {}
function M.setup()
  local configs = require("nvim-treesitter.configs")
  configs.setup {
    ensure_installed = { "python", "scala", "yaml", "lua", "javascript", "http"},
    sync_install = true,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    rainbow = {
      enable = true,
      disable = { "sql" }, -- list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    indent = { enable = true },
  }

end

return M
