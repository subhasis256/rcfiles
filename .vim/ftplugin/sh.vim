function! ShComment()
    s!^!#!
endfunction

vnoremap <silent> <buffer> c :call ShComment()<cr>
nnoremap <silent> <buffer> c :call ShComment()<cr>
inoremap <silent> <buffer> <c-c> <esc>:call ShComment()<cr>i

function! ShUnComment()
    s!^\(\s*\)#!\1!
endfunction

vnoremap <silent> <buffer> C :call ShUnComment()<cr>
nnoremap <silent> <buffer> C :call ShUnComment()<cr>
inoremap <silent> <buffer> <c-d> <esc>:call ShUnComment()<cr>

