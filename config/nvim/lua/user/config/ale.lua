--vim.cmd([[
--let g:ale_pattern_options = {
--\ 'py$': {'ale_linters': [], 'ale_fixers': []},
--\ 'lua$': {'ale_linters': [], 'ale_fixers': []},
--\ 'template.yaml$': {'ale_linters': ['cfn-python-lint'], 'ale_fixers': []},
--\}
--]])
--vim.g.ale_pattern_options_enabled = 1

-- vim.cmd([[ let b:ale_linters = ['cloudformation',] ]]j
local M = {}
function M.setup()
  vim.cmd([[
let g:ale_linters = {
\   'cloudformation': ['cloudformation'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_linters_explicit = 1
]] )

end

return M
