" Welcome to Vim (http://go/vim).
"
" If you see this file, your homedir was just created on this workstation.
" That means either you are new to Google (in that case, welcome!) or you
" got yourself a faster machine.
" Either way, the main goal of this configuration is to help you be more
" productive; if you have ideas, praise or complaints, direct them to
" vi-users@google.com (http://g/vi-users). We'd especially like to hear from you
" if you can think of ways to make this configuration better for the next
" Noogler.
" If you want to learn more about Vim at Google, see http://go/vimintro.

" Enable modern Vim features not compatible with Vi spec.
set nocompatible

"let g:google_coding_style_blacklist = ['.*']
"let g:syntastic_disabled_filetypes=['.*']
" Use the 'google' package by default (see http://go/vim/packages).
"""source /usr/share/vim/google/google.vim

" Plugin configuration.
" See http://google3/devtools/editors/vim/examples/ for example configurations
" and http://go/vim/plugins for more information about vim plugins at Google.

" Plugin loading is commented out below - uncomment the plugins you'd like to
" load.

" Load google's formatting plugins (http://go/vim/plugins/codefmt-google).
" The default mapping is \= (or <leader>= if g:mapleader has a custom value),
" with
" - \== formatting the current line or selected lines in visual mode
"   (:FormatLines).
" - \=b formatting the full buffer (:FormatCode).
"
" To bind :FormatLines to the same key in insert and normal mode, add:
"   noremap <C-K> :FormatLines<CR>
"   inoremap <C-K> <C-O>:FormatLines<CR>
" Glug codefmt plugin[mappings] gofmt_executable="goimports"
"""Glug codefmt-google

" Enable autoformatting on save for the languages at Google that enforce
" formatting, and for which all checked-in code is already conforming (thus,
" autoformatting will never change unrelated lines in a file).
"""augroup autoformat_settings
  " For BUILD files and Go all of Google's files must be formatted.
  """autocmd FileType bzl AutoFormatBuffer buildifier
  """autocmd FileType go AutoFormatBuffer gofmt
"""augroup END

" Load YCM (http://go/ycm) for semantic auto-completion and quick syntax
" error checking. Pulls in a google3-enabled version of YCM itself and
" a google3-specific default configuration.
"""let g:ycm_enable_diagnostic_signs = 0
"""let g:ycm_enable_diagnostic_highlighting = 0
"""Glug youcompleteme-google

" Load the automated blaze dependency integration for Go.
" Note: for Go, blazedeps uses the Go team's glaze tool, which is fully
" supported by the Go team; for other languages. Note that the plugin is
" currently unsupported for other languages.
"Glug blazedeps auto_filetypes=`['go']`

" Load piper integration (http://wiki/Main/VimPerforce).
" Glug piper plugin[mappings]

" Load the Critique integration. Use :h critique for more details.
" Glug critique plugin[mappings]

" Load blaze integration (http://go/blazevim).
" Glug blaze plugin[mappings]

" Load the syntastic plugin (http://go/vim/plugins/syntastic-google).
" Note: this requires installing the upstream syntastic plugin from
" https://github.com/scrooloose/syntastic.
"Glug syntastic-google

" Load the ultisnips plugin (http://go/ultisnips).
" Note: this requires installing the upstream ultisnips plugin from
" https://github.com/SirVer/ultisnips.
"Glug ultisnips-google

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

" Dont highlight tabs
"""Glug whitespace !highlight

autocmd BufRead,BufNewFile,BufReadPost /usr/local/google/home/bgardon/* setlocal sw=8 ts=8 noexpandtab
"""autocmd BufRead,BufNewFile,BufReadPost /usr/local/google/home/bgardon/* call whitespace#ClearHighlight()
set sw=8 ts=8 noexpandtab

" Turn on mouse support
set mouse=a

" Set vim to automatically read changed files that haven't been edited
set autoread

set scrolloff=6

" Highlight column 80
set ruler
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=80

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
