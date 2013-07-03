" Pathogen load
filetype off

"execute pathogen#infect()

"let g:jedi#show_function_definition = 0 " Do not show doc window
"let g:jedi#use_tabs_not_buffers = 0 " I use buffers
"let g:jedi#autocompletion_command ="<C-n>"

let g:neocomplcache_enable_at_startup = 1

colorscheme desert
syntax on
filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
filetype on
set expandtab
set shiftwidth=3
set softtabstop=3
set autoindent " automatic indent new lines
set smartindent " be smart about it
"set nowrap " do not wrap lines

set ruler
set number
set showmatch


" ---------------------------------------------------------------------------
" Strip all trailing whitespace in file - courtesy of https://github.com/holman
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>


