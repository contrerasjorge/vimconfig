call plug#begin('~/.vim/plugged')

Plug 'windwp/nvim-autopairs'
Plug 'sjl/tslime.vim'
"Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'
Plug 'christoomey/vim-tmux-navigator'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'janko-m/vim-test'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdcommenter'

Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Themes
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'Matsuuu/pinkmare'
Plug 'colepeters/spacemacs-theme.vim'

" File Explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Nvim Lsp
Plug 'neovim/nvim-lspconfig'
" Autocompletion framework for built-in LSP
"Plug 'nvim-lua/completion-nvim'
" Extensions to built-in LSP, provides type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'scalameta/nvim-metals'

Plug 'hrsh7th/nvim-compe'

" Lua
Plug 'tjdevries/nlua.nvim'
Plug 'euclidianAce/BetterLua.vim'

" For telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'rhysd/vim-clang-format'

" Because typescriptreact spacing needs to work!
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"Plug 'jparise/vim-graphql'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" debuggger
Plug 'mfussenegger/nvim-dap'

" Lalala 🎶 maybe in the future I'll use 'em
"Plug 'JuliaEditorSupport/julia-vim'

" Snippets
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

lua require("lsp-config")

" You can move anywhere!!!
" set virtualedit=all

" Theme Stuff
set termguicolors "enable true colors support
colorscheme onedark
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let ayucolor="mirage"

let mapleader = " "

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" move highlight up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Open and source vimrc file
nnoremap <silent> <leader>ev :e ~/.vimrc<CR>
nnoremap <silent> <leader>sv :so ~/.vimrc<CR>
nnoremap <silent> <leader>s; :luafile % ~/.vim/lua/lsp-config.lua<CR>
nnoremap <silent> <leader>e; :e ~/.vim/lua/lsp-config.lua<CR>
nnoremap <silent> <leader>lu :luafile %<CR>


syntax enable
filetype on
filetype plugin on
filetype indent on

set shortmess-=F
set shortmess+=c
set exrc
set nohlsearch
set cursorline
set wildmenu
" set number
set relativenumber
set nu
set hidden
set updatetime=300
set nocompatible
set colorcolumn=80
set signcolumn=yes
set showmatch
set nowrap
set laststatus=2
set backspace=2
set ignorecase
set smartcase
set incsearch
set noerrorbells visualbell t_vb=
set scrolloff=8
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

" tslime.vim
let g:tslime_ensure_trailing_newlines = 1 " Always send newline
let g:tslime_normal_mapping = '<leader>sl'
let g:tslime_visual_mapping = '<leader>sl'

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>
nnoremap <leader>fs <cmd>Telescope file_browser<cr>
nnoremap <leader>fd <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>fp <cmd>Telescope oldfiles<cr>
" 一番の大事な設定
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>

" Nvim-tree 
nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>
let g:nvim_tree_side = 'right'
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_quit_on_open = 1


" Fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>


" Markdown Preview
nmap <C-s> <Plug>MarkdownPreviewToggle


" Copy and stuff
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>V gg"+yG


"""""""""""Language Settings"""""""""""


" Go
augroup ft_golang
  au!

  au BufEnter,BufNewFile,BufRead *.go setlocal formatoptions+=roq
  au BufEnter,BufNewFile,BufRead *.go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
  au BufEnter,BufNewFile,BufRead *.tmpl setlocal filetype=html

  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')

augroup END


" Rust
augroup ft_rust
  au!
  au BufEnter,BufNewFile,BufRead *.rs :compiler cargo
  au FileType rust set nolist
augroup END


" Racket
au BufEnter,BufNewFile,BufRead *.rkt set filetype=racket


" Python
"autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
au BufNewFile,BufRead *.py
    \| set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix


" C & C++
augroup ft_c
  au!
  au BufNewFile,BufRead *.h setlocal filetype=c
  au Filetype c setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  au Filetype c setlocal cinoptions=l1,t0,g0 " This fixes weird indentation of switch/case
augroup END

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BreakBeforeBraces" : "Stroustrup"
            \ }
"let g:clang_format#auto_format = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>


" JS & TS 
"autocmd BufWritePre *.js,*.ts,*.tsx,*.jsx Neoformat
augroup ft_typescript
  au!

  au Filetype typescript setlocal shiftwidth=2 softtabstop=2 expandtab
augroup END

" JSON color highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd BufWritePre *.go lua goimports(1000)
