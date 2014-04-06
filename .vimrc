" Pathogen
execute pathogen#infect()

" Line numbers + tabs
set number
set tabstop=2
set shiftwidth=2
set expandtab

" Solarized
syntax enable
" set background=dark
" colorscheme solarized

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

" Wavestore header
function! <SID>InsertWSHeader()
  let l:header = ['/*********************************************************************']
  let l:header += [' *  Copyright (c) 2009-%YEAR% Wavestore Ltd.']
  let l:header += [' *  All Rights Reserved.']
  let l:header += [' *']
  let l:header += [' * NOTICE:  All information contained herein is, and remains']
  let l:header += [' * the property of Wavestore Ltd. and its suppliers, if any.']
  let l:header += [' * The intellectual and technical concepts contained  herein are']
  let l:header += [' * proprietary to Wavestore Ltd. and its suppliers and may be covered']
  let l:header += [' * by U.K., U.S, and Foreign Patents, patents in process, and are']
  let l:header += [' * protected by trade secret or copyright law.']
  let l:header += [' * Dissemination of this information or reproduction of this material']
  let l:header += [' * is strictly forbidden unless prior written permission is obtained']
  let l:header += [' * from Wavestore Ltd.']
  let l:header += [' */']
  for z in range(0, len(l:header) - 1)
    let l:header[z] = substitute(l:header[z], "%YEAR%", strftime("%Y"), "")
  endfor
  call append(0, l:header)
endfun

:nnoremap <leader>h :call <SID>InsertWSHeader()<CR>
