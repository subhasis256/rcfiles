setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal nosmartindent

function! PyComment()
    s!^!#!
endfunction

vnoremap <silent> <buffer> c :call PyComment()<cr>
nnoremap <silent> <buffer> c :call PyComment()<cr>
inoremap <silent> <buffer> <c-c> <esc>:call PyComment()<cr>i

function! PyUnComment()
    s!^\(\s*\)#!\1!
endfunction

vnoremap <silent> <buffer> C :call PyUnComment()<cr>
nnoremap <silent> <buffer> C :call PyUnComment()<cr>
inoremap <silent> <buffer> <c-d> <esc>:call PyUnComment()<cr>

