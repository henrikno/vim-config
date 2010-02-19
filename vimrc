set nocompatible

let mapleader = ","

syntax on
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
"set wildmode=longest:full,full
set wildmenu
set wildignore=*.o,*.obj,*.class
set showmode
set showcmd
set hlsearch
"set mouse=a
set modeline
set nowrap

set pastetoggle=<F8>

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
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" make cd <curdir>
nmap <Leader>cd :cd %:p:h<CR>
nmap <Leader>lcd :lcd %:p:h<CR>

" shortcut to Alternate file
nmap <Leader>a :A<CR>

set history=1000

" Keyboard shortcuts
map <F6> :b#<CR>
"nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprevious<CR>
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>
nmap <F3> @q


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



"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i




" omni-complete
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
set tags+=~/.vim/tags/c
set tags+=~/.vim/tags/cpp
set suffixes+=.class
imap <silent> <C-SPACE> <C-X><C-O>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ src

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=longest,menuone,menu,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

nmap <C-Tab> <C-W><C-W>
nmap <S-Right> :bnext<CR>
nmap <S-Left> :bprevious<CR>

cab Q q
cab W w

iab sysout System.out.println(


""""""""""""""""
""" PLUGINS
""""""""""""""""

" Fuf settings
"nmap <Leader>b :FufBuffer<CR>
"nmap <Leader>f :FufFile<CR>
"nmap <Leader>t :FufTag<CR>
let g:fuf_modesDisable = []

let g:fuf_mrufile_maxItem = 300
let g:fuf_splitPathMatching = 1
let g:fuf_keyOpenTwo = '<Tab>'
nnoremap <silent> <Leader>b      :FufBuffer<CR>
nnoremap <silent> <Leader>f      :FufFileWithCurrentBufferDir<CR>
"nnoremap <silent> <C-f><C-p> :FufFileWithFullCwd<CR>
nnoremap <silent> <Leader>sf     :FufFile<CR>
nnoremap <silent> <Leader>m      :FufMruFile<CR>
"nnoremap <silent> <C-k>      :FufMruCmd<CR>
"nnoremap <silent> <C-b>      :FufBookmark<CR>
"nnoremap <silent> <C-f><C-t> :FufTag<CR>
"nnoremap <silent> <C-f>t     :FufTag!<CR>
"noremap  <silent> g]         :FufTagWithCursorWord!<CR>
"nnoremap <silent> <C-f><C-f> :FufTaggedFile<CR>
"nnoremap <silent> <C-f><C-j> :FufJumpList<CR>
"nnoremap <silent> <C-f><C-g> :FufChangeList<CR>
"nnoremap <silent> <C-f><C-q> :FufQuickfix<CR>
"nnoremap <silent> <C-f><C-b> :FufAddBookmark<CR>
"vnoremap <silent> <C-f><C-b> :FufAddBookmarkAsSelectedText<CR>
"nnoremap <silent> <C-f><C-e> :FufEditInfo<CR>
"nnoremap <silent> <C-f><C-r> :FufRenewCache<CR>
