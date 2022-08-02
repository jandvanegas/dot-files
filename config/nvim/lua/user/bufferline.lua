local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end
vim.opt.termguicolors = true
bufferline.setup({
  options = {
    show_close_icon = false,
    numbers = 'ordinal',
    diagnostics = "nvim_lsp",
    offsets = {{filetype = "NvimTree", text = function()
      return vim.fn.getcwd()
    end, text_align = "left"}},
    separator_style = "padded_slant",
  }
}
)

