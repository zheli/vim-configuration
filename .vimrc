call plug#begin('~/.vim/plugged')
" Colors
Plug 'https://github.com/altercation/vim-colors-solarized.git'
" Syntax Check
Plug 'neomake/neomake'
" Add plugins to &runtimepath
call plug#end()

" Interface
syntax enable " enable syntax support
color solarized

" FileType {
filetype on " enable filetype detect

" Neomake {
autocmd! BufWritePost * Neomake " run Neomake syntax check on the current file on every write
let g:neomake_open_list=1       " open quickfix or list window when there is error
" }

" }
