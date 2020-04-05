call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'
Plug 'bronson/vim-visual-star-search'
Plug 'frazrepo/vim-rainbow'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

syntax enable
filetype on
filetype plugin on
filetype indent on

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:rainbow_active = 1


" Check if we can load the FZF vim plugin
if filereadable("/usr/local/opt/fzf/bin/fzf")
  set rtp+=/usr/local/opt/fzf
end

if filereadable("/home/mrnugget/.fzf/bin/fzf")
  set rtp+=/home/mrnugget/.fzf
end

set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number
" set relativenumber

set colorcolumn=80
set showmatch
set nowrap

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start
set hidden

set ignorecase
set smartcase
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab


" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Go
let g:go_fmt_command = "goimports"

" Rust
let g:rustfmt_autosave = 1
