" Pathogen
execute pathogen#infect()

" Line numbers + tabs
set number
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

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

" ...and strip it on save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" clang_complete
let s:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
  let g:clang_library_path = s:clang_library_path
endif

