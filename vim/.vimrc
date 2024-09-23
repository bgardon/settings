" Enable modern Vim features not compatible with Vi spec.
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic :set paste on pasting                         "
" From https://github.com/ConradIrwin/vim-bracketed-paste "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("g:loaded_bracketed_paste")
  finish
endif
let g:loaded_bracketed_paste = 1

let &t_ti .= "\<Esc>[?2004h"
let &t_te .= "\<Esc>[?2004l"

function! XTermPasteBegin(ret)
  set pastetoggle=<f29>
  set paste
  return a:ret
endfunction

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>

" All of your plugins must be added before the following line.

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on

syntax on

autocmd BufRead,BufNewFile,BufReadPost /usr/local/google/home/bgardon/* setlocal sw=8 ts=8 noexpandtab
set sw=8 ts=8 noexpandtab

" Turn on mouse support
set mouse=a

" Set vim to automatically read changed files that haven't been edited
set autoread

set scrolloff=8

" Highlight column 81
set ruler
highlight ColorColumn ctermbg=lightgrey guibg=darkgrey
set colorcolumn=81

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
