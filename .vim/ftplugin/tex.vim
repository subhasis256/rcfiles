setlocal fo+=t
setlocal textwidth=80
setlocal nocindent
setlocal noautoindent
setlocal nosmartindent
function! LatexComment()
    s!^!%!
endfunction

vnoremap <silent> <buffer> c :call LatexComment()<cr>
nnoremap <silent> <buffer> c :call LatexComment()<cr>
inoremap <silent> <buffer> <c-c> <esc>:call LatexComment()<cr>i

function! LatexUnComment()
    s!^\(\s*\)%!\1!
endfunction

vnoremap <silent> <buffer> C :call LatexUnComment()<cr>
nnoremap <silent> <buffer> C :call LatexUnComment()<cr>
inoremap <silent> <buffer> <c-d> <esc>:call LatexUnComment()<cr>
