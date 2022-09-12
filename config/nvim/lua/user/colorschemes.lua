-- local colorscheme = "tokyonight" -- it works well
-- local colorscheme = "darcula" -- kind of similar to jetbrains but not that much
local colorscheme = "dracula"

-- vim.cmd([[let g:dracula_colorterm = 0]])
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found! ")
  return
end
