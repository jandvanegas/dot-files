local vim = vim
local api = vim.api

api.nvim_create_autocmd("BufNew", {
  pattern = "*",
    command = [[:normal zR]]
})

