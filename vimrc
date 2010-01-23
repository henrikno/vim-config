
let mapleader = ","

" set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

""" tab settings
set shiftwidth=4
set softtabstop=4
set expandtab
set cindent
set smarttab
set autoindent

set grepprg=ack
set grepformat=%f:%l:%m

set title
set backspace=start,eol,indent
set incsearch " walk as you search
set showmatch " show matching brackets
set ignorecase
set smartcase " smart search... lowercase = any case
set shiftround
set hidden
set guioptions-=T
set wildmode=longest:full,full
set wildmenu
set showmode
set showcmd
set hlsearch
set nocompatible
"set mouse=a

set backupdir=~/.backup
set dir=~/.backup

autocmd FileType make set noexpandtab shiftwidth=8


" make switching windows easier
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>

nmap <silent> <leader>n :silent :nohlsearch<CR>


" Test
"inoremap '' ''<Left>
"inoremap "" ""<Left>
"inoremap () ()<Left>
"inoremap <> <><Left>
"inoremap {} {}<Left>
"inoremap [] []<Left>
"inoremap () ()<Left>

" keep a 8 line space between cursor and end of screen
set scrolloff=5

set foldenable
"set foldmarker={,}
"set foldmethod=marker
"set foldlevel=100
"set foldopen=block,hor,mark,percent,quickfix,tag

" make [[ etc. work with { at end of if/while...
:map [[ ?{<CR>w99[{
:map ][ /}<CR>b99]}
:map ]] j0[[%/{<CR>
:map [] k$][%?}<CR>

" make cd <curdir>
map ,cd :cd %:p:h<CR>

" shortcut to Alternate file
map ,a :A<CR>

set history=300

" Keyboard shortcuts
map <F6> :b#<CR>
"nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprevious<CR>
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>


" Save and make current file.o
function! Make()
  let curr_dir = '/home/henrik/Programmering/search/build/'
  if curr_dir == ''
    let curr_dir = '.'
  endif
  echo curr_dir
  execute 'lcd ' . curr_dir
  execute 'make'
  execute 'lcd -'
endfunction
nnoremap <F5> :update<CR>:call Make()<CR>


map <Leader>b :FufBuffer<CR>
nmap ,fb :FufBuffer<CR>
nmap ,ff :FufFile<CR>
nmap ,ft :FufTag<CR>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let NERD_c_alt_style=1
let NERD_cpp_alt_stype=1


"if has("gui_running")
  " If the current buffer has never been saved, it will have no name,
  " call the file browser to save it, otherwise just save it.
  ":map <silent> <C-S> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR>
"endif

:map <silent> <F2> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR>
:imap <F2> <Esc><F2>


let g:I=0
function! INC(increment)
    let g:I =g:I + a:increment
    return g:I
endfunction
