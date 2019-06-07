set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
endif     

syntax enable

let g:ycm_autoclose_preview_window_after_completion=1

set encoding=utf-8

set number
set tabstop=4
set shiftwidth=4
set expandtab

set autowrite
set smartindent
set showmatch
set hlsearch
set incsearch
set autochdir
set showcmd
set foldmethod=syntax
set foldnestmax=1
set hidden
set visualbell

set laststatus=2

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set cindent
set cinoptions+=g0

filetype on
filetype indent on
"filetype plugin on
set nocp

autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
au BufRead,BufNewFile *.cpp setfiletype cpp
au BufRead,BufNewFile *.cc setfiletype cpp
au BufRead,BufNewFile *.h setfiletype cpp
"au BufRead,BufNewFile *.tex Voom latex

map <silent> <CR> :noh<CR>
map <silent> <F2> :split<CR>
map <silent> <F3> :vsplit<CR>
map <silent> <F5> :!./%:r<CR>
map <silent> <C-e> :!chmod +x %<CR>
map <silent> <F8> :!g++ -std=c++11 -O3 % -o%:r<CR>

abbr #b /******************************************************************************************
abbr #e ****************************************************************************************/

let g:Tex_DefaultTargetFormat = 'pdf'
let g:tex_flavor = "latex"
let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $* >/dev/null'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

