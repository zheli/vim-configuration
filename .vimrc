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
Plug 'tpope/vim-fugitive'
" Show git diff in vim
Plug 'airblade/vim-gitgutter'
" Tagbar
Plug 'majutsushi/tagbar'

" ==Function===
" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'
" Editing
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'https://github.com/godlygeek/tabular.git' " make text into column
Plug 'ervandew/supertab' " so YouComplete me and use <tab> with ultisnip
" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
"Code snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'zheli/zhe-ultisnips-snippets'
" Code Completion
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
" Save sessions
Plug 'https://github.com/tpope/vim-obsession.git'
"Ag search
Plug 'albfan/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
" Undo tree
Plug 'mbbill/undotree'
" python-mode for Python
Plug 'https://github.com/klen/python-mode.git'

" Filetypes
"
" Angular
Plug 'burnettk/vim-angular'
" Dockerfile
Plug 'ekalinin/Dockerfile.vim'
" Elixir
Plug 'elixir-lang/vim-elixir'
" JSON
Plug 'elzr/vim-json'
" Terraform
Plug 'hashivim/vim-terraform'
"  YAML
Plug 'avakhov/vim-yaml'

" Add plugins to &runtimepath
call plug#end()

" Interface
syntax enable " enable syntax support
color sorcerer
set wildmode=longest,list,full " set <tab> completion behavior
set wildmenu " show autocomplete options
set number " enable line number
set hlsearch " highlight all search matches
set showcmd             " Show (partial) command in status line.
set tabstop=4 " show existing tab with 4 spaces width
set softtabstop=4 " fill in the indentation gaps with 4 spaces
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set autoindent

set textwidth=100 "wrap line that is longer than 100
set colorcolumn=100 "color text when length is over 100

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
let NERDTreeQuitOnOpen=1 "auto close nerdtree
let g:NERDTreeUpdateOnWrite = 0 " issue: https://github.com/Xuyuanp/nerdtree-git-plugin/issues/4
" }
" Tagbar {
let g:tagbar_autofocus = 1 " focus on tagbar window automatically
let g:tagbar_autoclose = 1
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
" undo tree
nnoremap <F5> :UndotreeToggle<CR>
" Gstatus toggle
nmap <F6> :ToggleGStatus<CR>
" Tagbar
nmap <F8> :TagbarToggle<CR>
" search current word
nnoremap <Leader>s :%s/\<<C-r><-C-w>\>/
" search current word inside git repo
nnoremap <leader>gr :Ggr <cword><CR>
" make Ggrep run silently so we don't need to type extra enter
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
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

" Undo tree {
" set persistent_undo
let g:undotree_WindowLayout=4 " undo tree layout https://github.com/mbbill/undotree/blob/master/plugin/undotree.vim#L15
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
" }

" make YCM compatible with UltiSnips (using supertab) {
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'
let g:ycm_server_python_interpreter = '/usr/bin/env python'
" }
" better key bindings for UltiSnipsExpandTrigger {
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" }

" }

" FileType {

filetype on " enable filetype detect
filetype indent plugin on

" ignore list
set wildignore=*.o,*~,*.pyc

" file type specfic format {
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
" }

" Neomake {
autocmd! BufWritePost * Neomake " run Neomake syntax check on the current file on every write
let g:neomake_open_list=2       " open quickfix or list window when there is error
let g:neomake_python_enabled_makers = ['python', 'pylama', 'mypy']

" }

" pymode {
let g:pymode_lint=0
let g:pymode_rope=1
let g:pymode_options_max_line_length=100
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
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
if !exists(':ToggleGStatus')
	command ToggleGStatus :call ToggleGStatus()
endif

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

" Stupid shift key fixes
if has("user_commands")
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang -nargs=* -complete=file Edit edit<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

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
