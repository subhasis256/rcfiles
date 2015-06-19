function! CComment()
    s!^!//!
endfunction

vnoremap <silent> <buffer> c :call CComment()<cr>
nnoremap <silent> <buffer> c :call CComment()<cr>
inoremap <silent> <buffer> <c-c> <esc>:call CComment()<cr>i

function! CUnComment()
    s!^\(\s*\)//!\1!
endfunction

vnoremap <silent> <buffer> C :call CUnComment()<cr>
nnoremap <silent> <buffer> C :call CUnComment()<cr>
inoremap <silent> <buffer> <c-d> <esc>:call CUnComment()<cr>

autocmd CursorMoved * exe printf('match TabLineSel /\V\<%s\>/', escape(expand('<cword>'), '/\'))
nnoremap <silent> t :TlistToggle<CR>
nnoremap <silent> <c-m> :make<cr><cr>
