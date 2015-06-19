syntax on
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys=0{,0},0),:,0#,!^F,o,O,e
set nocp
set textwidth=80

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
" Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
map <C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
fun! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>
set wildmenu
set wildmode=list:longest
let g:tex_flavor = "latex"

set statusline=%<[%{winnr()}]\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2

filetype plugin on
filetype plugin indent on
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
    au! BufRead,BufNewFile *.ckt*   set filetype=spice
    au! BufRead,BufNewFile *.sp     set filetype=spice
    au! BufRead,BufNewFile *.lib    set filetype=spice
    au! BufRead,BufNewFile *.pm     set filetype=spice
augroup END

nnoremap <silent> s i<cr><Esc>
nnoremap <silent> <c-j> :make<cr><cr>
nnoremap Q <nop>

set ruler

autocmd FileType python setlocal completeopt-=preview
