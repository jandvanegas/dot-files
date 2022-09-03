local M = {}

function M.setup()
  require("bufferline").setup {
    options = {
      numbers = 'ordinal',
      diagnostics = "nvim_lsp",
      offsets = { { filetype = "NvimTree", text = function()
        return vim.fn.getcwd()
      end, text_align = "left" } },
      mode = 'tabs',
      separator_style = "padded_slant",
      show_buffer_close_icons = false,
      show_close_icon = false,
    }
  }
end

return M
