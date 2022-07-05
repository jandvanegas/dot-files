:set ignorecase
set number 
:set colorcolumn=72

" gdb
let mapleader = ","
let g:termdebug_popup = 0
let g:termdebug_wide = 163

call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'ekickx/clipboard-image.nvim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rhysd/vim-grammarous'
Plug 'chrisbra/csv.vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-surround'
"Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-sneak'
" linting checking
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'arcticicestudio/nord-vim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()
" delete without yanking
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
"vnoremap <leader>p "_dP
"if exists('$TMUX')
"	let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
"	let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
"else
"	let &t_SI = "\e[5 q"
"	let &t_EI = "\e[2 q"
"endif
set clipboard+=unnamed
set clipboard+=unnamedplus
let b:table_mode_corner='+'

let g:vim_markdown_folding_disabled = 1

" buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" coc actions
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
" color scheme
colorscheme nord
" custom neovim python
let g:python3_host_prog = '/home/javanegas/customenvs/neovim/bin/python'
" Navigation
map <Leader>nf :NERDTreeFocus<CR>

" Vimspector
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' , 'multi-session']
" let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>da :call vimspector#Attach()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
