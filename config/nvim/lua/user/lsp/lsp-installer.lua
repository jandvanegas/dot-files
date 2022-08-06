local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.setup{}

local lspconfig = require("lspconfig")
local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

local jsonls_opts = require("user.lsp.settings.jsonls")
lspconfig.jsonls.setup(
  vim.tbl_deep_extend("force", jsonls_opts, opts)
)

local sumneko_opts = require("user.lsp.settings.sumneko_lua")
lspconfig.sumneko_lua.setup(
  vim.tbl_deep_extend("force", sumneko_opts, opts)
)

local yamlls_opts = require("user.lsp.settings.yamlls")
lspconfig.yamlls.setup(
  vim.tbl_deep_extend("force", yamlls_opts, opts)
)

local pyright_opts = require("user.lsp.settings.pyright")
lspconfig.pyright.setup(
  vim.tbl_deep_extend("force", pyright_opts, opts)
)

local marksman_opts = require("user.lsp.settings.marksman")
lspconfig.marksman.setup(
  vim.tbl_deep_extend("force", marksman_opts, opts)
)
