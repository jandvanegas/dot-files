vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 3 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,]" -- <> are the arrow keys in normal and visual mode [] are the arrow kyes in insert mode
-- vim.cmd [[set iskeyword+=-]] -- adds hiphen to the list of characters to be part of a word
vim.opt.autowrite = true -- saves when swithching buffers
vim.opt.autowriteall = true
vim.opt.hidden = true -- does not allow to switch without saving (needed for autowrite to work). Should be false for saving, but toggleterm needs true.

vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Folding
-- Folding with treesitter
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Folding with ufo
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Python path
vim.cmd [[ let g:python3_host_prog = "./.venv/bin/python" ]]

-- FixCursorHold plugin
--vim.cmd [[
--  let g:cursorhold_updatetime = 10
--]]
-- vim.g.copilot_filetypes = { "python" = true, "javascript" = false }
vim.cmd [[
let g:copilot_filetypes = {
	\ '*': v:false,
	\ 'python': v:true,
	\ 'javascript': v:true,
	\ 'lua': v:true,
	\ 'json': v:true,
	\ }
]]
vim.cmd [[
let g:copilot_node_command =
  \ "~/.nvm/versions/node/v18.20.3/bin/node"
]]
