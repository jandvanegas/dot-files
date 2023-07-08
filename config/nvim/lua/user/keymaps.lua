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
keymap("n", "<leader>w", ":w <CR>", opts)
keymap("n", "<leader>W", ":w <CR>| :Bdelete<CR>", opts)

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
keymap("n", "<leader>tt", "<cmd>ToggleTerm<cr>", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
keymap("n", "<leader>fa", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require'telescope'.extensions.live_grep_args.live_grep_args()<cr>", opts)
keymap("n", "<leader>fb", ":Telescope file_browser<cr>", opts)
keymap("v", "<leader>fa", "<cmd>lua require'telescope.builtin'.grep_string()<cr>", opts)
keymap("n", "<leader>fs", "<cmd>lua require'telescope.builtin'.grep_string()<cr>", opts)
keymap("n", "<leader>fo", ":lua require'telescope.builtin'.oldfiles({ only_cwd = true})<cr>", opts)
keymap("n", "<leader>fr",
  "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)

-- Nvimtree
keymap("n", "<leader>nb", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<cr>", opts)

-- git blame
keymap("n", "<leader>vb", "<cmd>GitBlameToggle<cr>", opts)

-- code
-- keymap("n", "<leader>cf", ":w <cr> | :! ~/customenvs/black/bin/black % <cr> | :e <cr>", opts)
keymap("n", "<leader>cf", ":lua vim.lsp.buf.format{ async = true}<cr>", opts)

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
-- Rename
keymap("n", "<leader>rn", [[ <Cmd>lua vim.lsp.buf.rename()<CR>]], opts)

-- JUpyter
-- Ascending
keymap("n", "<leader><leader>x", ":call jupyter_ascending#execute()<CR>", opts)
keymap("n", "<leader><leader>X", ":call jupyter_ascending#execute_all()<CR>", opts)
--
-- Jupyter with Magma
keymap("n", "<localleader>r", ":MagmaEvaluateOperator<CR>", opts)
keymap("n", "<localleader>rr", ":MagmaEvaluateLine<CR>", opts)
keymap("n", "<localleader>rc", ":MagmaReevaluateCell<CR>", opts)
keymap("n", "<localleader>rd", ":MagmaDelete<CR>", opts)
keymap("n", "<localleader>ro", ":MagmaShowOutput<CR>", opts)
keymap("x", "<localleader>r ", "<C-u>MagmaEvaluateVisual :MagmaShowOutput<CR>", opts)

-- Testing
keymap("n", "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", opts)
keymap("n", "<leader>tr", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
keymap("n", "<leader>tR", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", opts)
keymap("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", opts)
keymap("n", "<leader>tL", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", opts)
keymap("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", opts)
keymap("n", "<leader>tN", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", opts)
keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", opts)
keymap("n", "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", opts)
keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", opts)
-- lsp saga
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
-- Hop
keymap('n', 'f',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
  , {})
keymap('n', 'F',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>"
  , {})
-- dap
keymap("n", "<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
keymap("n", "<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", opts)
keymap("n", "<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
keymap("n", "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", opts)
keymap("n", "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", opts)
keymap("n", "<leader>dg", "<cmd>lua require'dap'.session()<cr>", opts)
keymap("n", "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", opts)
keymap("n", "<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", opts)
keymap("n", "<leader>dq", "<cmd>lua require'dap'.close()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("v", "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- python dap
keymap("n", "<localleader>dm", "<cmd>lua require'dap-python'.test_method({config={redirectOutput=true, justMyCode=false}})<cr>", opts)
keymap("n", "<localleader>dc", "<cmd>lua require'dap-python'.test_class()<cr>", opts)
keymap("v", "<localleader>ds", "<cmd>lua require'dap-python'.debug_selection()<cr>", opts)
-- scala metals
keymap("n", "<localleader>sm", "<cmd>lua require'telescope'.extensions.metals.commands()<cr>", opts)
-- copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
keymap("i", "<C-l>", 'copilot#Accept("")', {expr=true, silent=true})
-- rest client
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", opts)
