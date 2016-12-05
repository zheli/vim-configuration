call plug#begin('~/.vim/plugged')

" ==Interface==
" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colors
Plug 'adlawson/vim-sorcerer'
Plug 'altercation/vim-colors-solarized'
Plug 'antlypls/vim-colors-codeschool'
Plug 'easysid/mod8.vim'
Plug 'freeo/vim-kalisi'
Plug 'mhartington/oceanic-next'
Plug 'scwood/vim-hybrid'
Plug 'Suave/vim-colors-guardian'
" Nerdtree
Plug 'scrooloose/nerdtree'
" Syntax Check
Plug 'neomake/neomake'
" Choose window like tmux
Plug 'https://github.com/t9md/vim-choosewin.git'
" numbers.vim is a plugin for intelligently toggling line numbers
Plug 'myusuf3/numbers.vim'
" toggle list with shortcuts
Plug 'milkypostman/vim-togglelist'
" Fugitive for Git commands
Plug 'https://github.com/tpope/vim-fugitive.git'

" ==Function===
" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'
" Editing
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'https://github.com/godlygeek/tabular.git' " make text into column
" Code Completion
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}

" Filetypes
"
"  YAML
Plug 'avakhov/vim-yaml'

" Add plugins to &runtimepath
call plug#end()

" Interface
syntax enable " enable syntax support
color sorcerer
set wildmenu " show autocomplete options
set wildmode=longest:full,full " set <tab> completion behavior
set number " enable line number
set hlsearch " highlight all search matches

"wrap line that is longer than 100
set wrap
set textwidth=100

set colorcolumn=+1 "color text when length is over 100

"highlight trailing whitespace
:hi ExtraWhitespace ctermbg=red guibg=red
call matchadd('ExtraWhitespace', '\s\+$', 11)

" Airline {
set laststatus=2 " always show statusline
let g:airline_powerline_fonts = 1 " use powerline font
" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
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

set smartcase " case insentive search if first letter is not capital

" Shortcut keys {
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
" Switch between absolute and relative line number
nnoremap <F3> :NumbersToggle<CR>
" Start choosewin
nmap - <Plug>(choosewin)
" Gstatus toggle
nmap <F6> :ToggleGStatus<CR>
"}

"Choosewin {
let g:choosewin_overlay_enable = 1
"}

" CtrlP {
let g:ctrlp_cmd = 'CtrlP' " use CtrlP mode
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|artifact)$',
  \ 'file': '\.png$',
  \ } " ignore node_modules and artifact folders, image files
let g:ctrlp_show_hidden = 1 " show hidden files
" }
" YouCompleteMe {
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
" }

" }

" FileType {

filetype on " enable filetype detect

" ignore list
set wildignore=*.o,*~,*.pyc

" file type specfic format {
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
" }

" Neomake {
autocmd! BufWritePost * Neomake " run Neomake syntax check on the current file on every write
let g:neomake_open_list=1       " open quickfix or list window when there is error
" }
" Helper functions {

" New Command ToggleGstatus for switching Gstatus window on/off
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfunction
command ToggleGStatus :call ToggleGStatus()

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction


augroup vimrc_autocmd
  autocmd!
  " auto remove trailling whitespace on save
  autocmd filetype c,cpp,java,php,ruby,python,php,vimrc,javascript autocmd bufwritepre <buffer> :call <sid>StripTrailingWhitespaces()
  " auto close when only nerdtree is left
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
augroup end
" }

" }
" vim: noai:ts=4:sw=4
