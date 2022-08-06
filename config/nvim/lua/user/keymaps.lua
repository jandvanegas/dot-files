local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap comma as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>nb", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>w", ":w <CR>| :Bdelete<CR>", opts)
keymap("n", "<leader>w", ":w <CR>| :Bdelete<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fa", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
keymap("n", "<leader>fs", "<cmd>lua require'telescope.builtin'.grep_string()<cr>", opts)
keymap("n", "<leader>fo", ":lua require'telescope.builtin'.oldfiles()<cr>", opts)
keymap("n", "<leader>fr", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

-- Nvimtree
keymap("n", "<leader>nb", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<cr>", opts)

-- git blame 
keymap("n", "<leader>vb", "<cmd>GitBlameToggle<cr>", opts)

-- code
-- keymap("n", "<leader>cf", ":w <cr> | :! ~/customenvs/black/bin/black % <cr> | :e <cr>", opts)
keymap("n", "<leader>cf", ":Format<cr>", opts)

-- trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- refactoring
keymap("v", "<leader>rr", ":lua require('refactoring').select_refactor()<CR>", opts)
-- Remaps for the refactoring operations currently offered by the plugin
keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], opts)
keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], opts)
keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], opts)
keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)
-- Extract block doesn't need visual mode
keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], opts)
keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], opts)
-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)

