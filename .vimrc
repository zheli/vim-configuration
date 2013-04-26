"let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'fancy'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
if &term =~ "xterm"
    "256 color --
    let &t_Co=256
    " restore screen after quitting
    set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="3%dm"
        let &t_Sb="4%dm"
    endif
else
    if &term =~ "screen-bce"
        "256 color --
        let &t_Co=256
        " restore screen after quitting
        set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
        if has("terminfo")
            let &t_Sf="\ESC[3%p1%dm"
            let &t_Sb="\ESC[4%p1%dm"
        else
            let &t_Sf="^[3%dm"
            let &t_Sb="^[4%dm"
        endif
    endif
endif

set t_Co=256
set number
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set autoindent
set cursorline
:syntax on
filetype plugin indent on
filetype plugin on
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
"colorscheme satori
set guioptions-=T
"change background color to red for line that is longer than 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%81v.\+/

"tab-completion
set wildmode=longest,list,full
set wildmenu

"pathogen
call pathogen#infect()

"solarized
"set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"always have nerdtree
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

"tagbar hotkey
nmap <F8> :TagbarToggle<CR>

"javascript support
let g:tarbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
\ }
