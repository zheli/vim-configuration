call plug#begin('~/.vim/plugged')

" ==Interface==
" Statusbar
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
" Colors
Plug 'https://github.com/altercation/vim-colors-solarized.git'
" Syntax Check
Plug 'neomake/neomake'

" ==Function===
" Fuzzy file opener
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
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
set number " enable line number

" Airline {
set laststatus=2 " always show statusline
let g:airline_powerline_fonts = 1 " use powerline font
let g:airline#extensions#tabline#enabled = 1 " Automatically displays all buffers when there's only one tab open.
let g:airline_theme='papercolor'
" }

" CtrlP {
let g:ctrlp_cmd = 'CtrlPMixed' " use CtrlPMixed mode
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|artifact)$',
  \ 'file': '\.png$',
  \ } " ignore node_modules and artifact folders, image files
let g:ctrlp_show_hidden = 1 " show hidden files
" }

" FileType {

filetype on " enable filetype detect

" Neomake {
autocmd! BufWritePost * Neomake " run Neomake syntax check on the current file on every write
let g:neomake_open_list=1       " open quickfix or list window when there is error
" }

" }
