local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = true,
  sources = {
    -- lua
    -- formatting.stylua, -- not installed yet
    --json
    formatting.json_tool,
    -- sql
    diagnostics.sqlfluff.with({
      extra_args = { "-d", "sqlite" }, -- change to your dialect
    }),
    formatting.sqlfluff.with({
      args = { "fix", "-n", "--disable_progress_bar", "--force", "-" },
      extra_args = { "-d", "sqlite" }, -- change to your dialect
    }),
    -- bash
    formatting.beautysh,
    -- js
    formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
    -- diagnostics.eslint,
    -- python
    formatting.black.with { extra_args = { "--fast" } },
    diagnostics.flake8,
    -- markdown
    diagnostics.markdownlint,
    formatting.mdformat,
  },
}
