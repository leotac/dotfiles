syntax on
set expandtab
set shiftwidth=4
set softtabstop=4
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


au BufRead,BufNewFile *.mod set filetype=ampl
au BufRead,BufNewFile *.dat set filetype=ampl 
