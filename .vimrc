" Good reference https://github.com/nickjj/dotfiles/blob/master/.vimrc
:set ignorecase
set number 
:set colorcolumn=72

" gdb
let mapleader = ","
let g:termdebug_popup = 0
let g:termdebug_wide = 163

call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
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
Plug 'puremourning/vimspector'
Plug 'arcticicestudio/nord-vim'

call plug#end()

set clipboard+=unnamed
set clipboard+=unnamedplus
let b:table_mode_corner='+'

let g:vim_markdown_folding_disabled = 1

" buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" color scheme
colorscheme nord
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

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Using iTerm2? Go-to preferences / profile / colors and disable the smart bar
" cursor color. Then pick a cursor and highlight color that matches your theme.
" That will ensure your cursor is always visible within insert mode.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

