setlocal smarttab
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal cino+=(0
setlocal cino+=+4
function! IndentNamespace()
  let l:cline_num = line('.')
  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  let l:retv = cindent('.')
  while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
    let l:pline_num = prevnonblank(l:pline_num - 1)
    let l:pline = getline(l:pline_num)
  endwhile
  if l:pline =~# '^\s*namespace.*'
    let l:retv = 0
  endif
  return l:retv
endfunction
setlocal indentexpr=IndentNamespace()

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
