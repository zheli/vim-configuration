call plug#begin('~/.vim/plugged')

" ==Interface==
" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colors
Plug 'adlawson/vim-sorcerer'
Plug 'altercation/vim-colors-solarized'
Plug 'easysid/mod8.vim'
Plug 'freeo/vim-kalisi'
Plug 'mhartington/oceanic-next'
Plug 'scwood/vim-hybrid'
" Nerdtree
Plug 'scrooloose/nerdtree'
" Syntax Check
Plug 'neomake/neomake'

" ==Function===
" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'
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

" Nerdtree {
silent! nmap <C-e> :NERDTreeToggle<CR> " Nerdtree hotkeys
let NERDTreeIgnore = ['\.pyc$'] " ignore pyc files
let NERDTreeShowHidden=1 " Show hidden files
let g:NERDTreeUpdateOnWrite = 0 " issue: https://github.com/Xuyuanp/nerdtree-git-plugin/issues/4
let NERDTreeQuitOnOpen=1 "auto close nerdtree
" }

" Editing {
" Moving lines up and down with Alt-j and Alt-k
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
" for Macs
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .-2<CR>==gi
inoremap ˚ <Esc>:m .+1<CR>==gi
vnoremap ∆ :m '<-2<CR>gv=gv
vnoremap ˚ :m '>+1<CR>gv=gv
" for Win/Linux
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" CtrlP {
let g:ctrlp_cmd = 'CtrlPMixed' " use CtrlPMixed mode
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|artifact)$',
  \ 'file': '\.png$',
  \ } " ignore node_modules and artifact folders, image files
let g:ctrlp_show_hidden = 1 " show hidden files
" }
" }

" FileType {

filetype on " enable filetype detect

" Neomake {
autocmd! BufWritePost * Neomake " run Neomake syntax check on the current file on every write
let g:neomake_open_list=1       " open quickfix or list window when there is error
" }

" }
