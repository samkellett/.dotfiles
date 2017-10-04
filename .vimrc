" Use Vim settings not Vi (this must be first)
set nocompatible

" Pathogen
execute pathogen#infect()

" Line numbers + tabs
set number
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

" Add visual column indicator
set colorcolumn=80

" Allow backspacing over everything
set backspace=indent,eol,start

" Auto and highlight searches
set incsearch
set hlsearch

" Better tab completion (ala Bash)
set wildmode=list:longest
set wildmenu

" Send more characters for redraws
set ttyfast

" Mouse Stuff
set mouse=a
set ttymouse=xterm2

" Autosave on focus lost
au FocusLost * silent! wa

" Colour scheme
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

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
let NERDTreeIgnore = ['\.o$', '\.lo$']

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

" swp directory
set directory=$HOME/.vim/swp//

" CtrlP settings
let g:ctrl_map = '<c-p>'
let g:ctrl_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = ''

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.svn|build|ext$',
  \ 'file': '\v^[^\.]+(\.(o|lo|tmp)|)$'
\ }

" Better find
nnoremap n nzz

" Make u Ctrl+u (too many accidental hits...)
noremap u <NOP>
noremap <C-u> u

" Persistant undo history
set undofile
set undodir=$HOME/.vim/undo//

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_close_on_revert = 1

" llvm.vim
augroup filetype
  au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

augroup filetype
  au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END

