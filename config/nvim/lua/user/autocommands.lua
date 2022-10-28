local vim = vim
local api = vim.api

api.nvim_create_autocmd("FileType", {
  pattern = { "python", "yaml", "lua", "yaml.cloudformation" },
  command = [[:normal zR]]
})

api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = {
    "*template.yaml",
    "*role*.yaml",
    "*Role*.yml",
    "*lambda*.yaml",
    "*s3*.yaml",
    "*dynamo*.yaml",
    "*iam*.yaml",
    "*kinesis*.yaml",
    "*cognito*.yaml",
    "*parameter*.yml",
    "*parameter*.yaml",
  },
  command = [[set filetype=yaml.cloudformation]]
})

-- api.nvim_create_autocmd("FileType", {
--   pattern = "*",
--   callback = function()
--     local data = {
--       buf = vim.fn.expand("<abuf>"),
--       file = vim.fn.expand("<afile>"),
--       match = vim.fn.expand("<amatch>")
--     }
--     vim.schedule(function()
--       print("We got here")
--       print(vim.inspect(data))
--     end)
--   end
-- })
