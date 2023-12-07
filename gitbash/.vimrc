" Good reference https://github.com/nickjj/dotfiles/blob/master/.vimrc
:set ignorecase
set number 
:set colorcolumn=72

" gdb
let mapleader = ","
let g:termdebug_popup = 0
let g:termdebug_wide = 163

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
" colorscheme nord
" Navigation
map <Leader>nf :NERDTreeFocus<CR>

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
