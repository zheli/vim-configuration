call plug#begin('~/.vim/plugged')
" Colors
Plug 'https://github.com/altercation/vim-colors-solarized.git'
" Syntax Check
Plug 'neomake/neomake'
" Editing
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Add plugins to &runtimepath
call plug#end()

" Interface
syntax enable " enable syntax support
color solarized
set wildmenu " show autocomplete options
set wildmode=longest:full,full " set <tab> completion behavior

" FileType {
filetype on " enable filetype detect

" Neomake {
autocmd! BufWritePost * Neomake " run Neomake syntax check on the current file on every write
let g:neomake_open_list=1       " open quickfix or list window when there is error
" }

" }
