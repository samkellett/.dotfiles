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

" Syntax File Associations
au BufNewFile,BufRead *.dql set filetype=sql
au BufNewFile,BufRead *.dql_inc set filetype=sql

" Disable arrow keys
noremap  <Up>  <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" NERDTree
map <silent> <C-n> :NERDTreeFocus<CR>

let NERDTreeQuitOnOpen=1

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
	  if winnr("$") == 1
	    q
	  endif
	endif
  endif
endfunction

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

" swp directory
set directory=$HOME/.vim/swp//

" Ctrl+S to save, Ctrl+q to quit
map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>a

map <C-q> :qa<cr>
imap <C-q> <ESC>:qa<cr>

" CtrlP settings
let g:ctrl_map = '<c-p>'
let g:ctrl_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = ''

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.svn$',
  \ 'file': '\v^[^\.]+(\.(o|lo)|)$'
\ }

" Disable <i> for entering insert mode (it's too close to <u>!)
noremap a <NOP>
noremap i <NOP>
noremap a i

