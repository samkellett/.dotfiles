" Pathogen
execute pathogen#infect()

" Line numbers + tabs
set number
set tabstop=2
set shiftwidth=2
set expandtab

" Solarized
syntax enable
set background=dark
colorscheme solarized

" Disable arrow keys
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" NERDTree
map <silent> <C-n> :NERDTreeFocus<CR>
