" Use Vim settings not Vi (this must be first)
set nocompatible

" Pathogen
execute pathogen#infect()

" Line numbers + tabs
set number
set tabstop=4
set shiftwidth=4
set autoindent

" Add visual column indicator
set colorcolumn=100

" Allow backspacing over everything
set backspace=indent,eol,start

" Auto and highlight searches
set incsearch
set hlsearch

" Better tab completion (ala Bash)
set wildmode=list:longest
set wildmenu

" Mouse Stuff
set mouse=a

" Autosave on focus lost
au FocusLost * silent! wa

" Colour scheme
syntax enable
colorscheme monokai

" Disable arrow keys
noremap  <Up>  <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" NERDTree
map <silent> <C-n> :NERDTreeFocus<CR>

" Highlight excess whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Syntastic
"  C++:
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1

