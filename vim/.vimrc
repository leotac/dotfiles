" Pathogen load
filetype off

"execute pathogen#infect()

"let g:jedi#show_function_definition = 0 " Do not show doc window
"let g:jedi#use_tabs_not_buffers = 0 " I use buffers
"let g:jedi#autocompletion_command ="<C-n>"


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


let g:Imap_UsePlaceHolders = 0

let g:neocomplcache_enable_at_startup = 0


colorscheme desert
syntax on
filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
filetype on
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent " automatic indent new lines
set smartindent " be smart about it
"set nowrap " do not wrap lines

"au FileType python setl sw=2 sts=2 et

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

set ruler
set number
set showmatch

let g:latex_to_unicode_file_types = ".*"

let g:latex_to_unicode_file_types = ".*"

" ---------------------------------------------------------------------------
" Strip all trailing whitespace in file - courtesy of https://github.com/holman
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

au BufNewFile *.py 0r ~/.vim/skeleton.py
au BufNewFile *.scala 0r ~/.vim/skeleton.scala

