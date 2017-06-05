runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

colorscheme Tomorrow-Night

set nocompatible
set number
set visualbell
set cursorline
set lazyredraw
set noshowmode
set mouse=a

set hidden
set hlsearch
set splitbelow
set splitright

set confirm
set nobackup
set nowb
set noswapfile

set wrap
set expandtab
set shiftwidth=4
set tabstop=4

set wildmenu
set wildignore=*.pyc

let mapleader = " "

" open previous file
nnoremap <leader>e :e#<cr>

" reload config
map <leader>r :source ~/.vimrc<cr>

" paste over selection without overwriting register
vnoremap p "_dP

" 0 is first char
map 0 ^

" Y consistent with D and C
map Y y$

" W mishit
:command! W w

" shortcut to usual macro
nnoremap <leader>q @q

" tab switching
nnoremap <s-right> :tabn<cr>
nnoremap <s-left> :tabp<cr>

" window switching
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" per filetype preferences
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType js setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead docker-compose.yml* setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead nginx.conf* setfiletype nginx

function! Indent2()
  setlocal tabstop=2 shiftwidth=2 softtabstop=2
endfun

function! Indent4()
  setlocal tabstop=4 shiftwidth=4 softtabstop=4
endfun

" open files to last position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" move lines
nnoremap <c-up> :m -2<cr>
nnoremap <c-down> :m +1<cr>
vnoremap <c-up> :m '<-2<cr>gv=gv
vnoremap <c-down> :m '>+1<cr>gv=gv

" remove trailing whitespace
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

" remove whitespace on save
autocmd BufWritePre <buffer> :call TrimWhitespace()


""" ctrlp

let g:ctrlp_match_window = 'bottom,order:ttb,max:20'
let g:ctrlp_switch_buffer = 't'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'rg --files %s'

let g:ctrlp_prompt_mappings = {
  \   'AcceptSelection("e")': ['<c-t>'],
  \   'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }


""" easymotion

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-overwin-f2)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)


""" ale

let g:ale_linters = {
  \   'html': [],
  \ }

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_python_pylint_options = '--disable=missing-docstring,invalid-name'
let g:ale_python_flake8_args = '--max-line-length 100'

let g:ale_set_highlights = 0

highlight clear ALEErrorSign
highlight clear ALEWarningSign

nmap , <Plug>(ale_next_wrap)


""" gitgutter

let g:gitgutter_sign_column_always=1


""" lightline

let g:lightline = { 'colorscheme': 'seoul256' }
