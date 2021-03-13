call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'sjl/tslime.vim'
Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'rust-lang/rust.vim'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'janko-m/vim-test'
"Plug 'w0rp/ale'
"Plug 'bronson/vim-visual-star-search'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" nvim lsp
Plug 'neovim/nvim-lspconfig'

" For telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


call plug#end()

" You can move anywhere!!!
set virtualedit=all

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set termguicolors "enable true colors support
let g:lucius_style  = 'light'
let g:lucius_contrast  = 'high'
let g:lucius_contrast_bg  = 'normal'
let g:lucius_no_term_bg  = 1
colorscheme material
let g:material_theme_style = 'palenight'

" Give the active window a blue background and white foreground
hi StatusLine ctermfg=15 ctermbg=32 cterm=bold
hi SignColumn ctermfg=255 ctermbg=15

" Highlight search
hi Search     ctermbg=yellow

syntax enable
filetype on
filetype plugin on
filetype indent on

syntax on

set cursorline
set wildmenu
set number
set hidden
set updatetime=300
set nocompatible
set colorcolumn=80
set showmatch
set nowrap
set laststatus=2
set backspace=2
set ignorecase
set smartcase
set incsearch
set noerrorbells visualbell t_vb=

" Indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

" FZF mappings and custom functions
nnoremap <silent> <leader>fc :BCommits<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fr :History<CR>
nnoremap <silent> <leader>fi :FZF<CR>
nnoremap <silent> <leader>gr :GFiles<CR>
nnoremap <silent> <C-p> :GFiles<CR>

" Check if we can load the FZF vim plugin
if filereadable("/usr/local/opt/fzf/bin/fzf")
  set rtp+=/usr/local/opt/fzf
end

" Prettier
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" tslime.vim
let g:tslime_ensure_trailing_newlines = 1 " Always send newline
let g:tslime_normal_mapping = '<leader>sl'
let g:tslime_visual_mapping = '<leader>sl'

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>


"""""""""""Language Settings"""""""""""


" Racket
au BufEnter,BufNewFile,BufRead *.rkt set filetype=racket


" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
au BufNewFile,BufRead *.py
    \| set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix


" Go
nmap <leader>gos :e /usr/local/go/src/<CR>
"let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_structs = 0
let g:go_rename_command = "gopls"
let g:go_echo_command_info = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_test_show_name = 1

let g:go_term_mode = "split"
let g:go_term_height = 10
" let g:go_term_enabled = 1

augroup ft_golang
  au!
  au BufEnter,BufNewFile,BufRead *.go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
  au BufEnter,BufNewFile,BufRead *.go setlocal completeopt-=preview
  " Enable automatic continuation of comment inserting
  au BufEnter,BufNewFile,BufRead *.go setlocal formatoptions+=ro
  au BufEnter,BufNewFile,BufRead *.tmpl setlocal filetype=html

  au Filetype go nmap <c-]> <Plug>(go-def)
  au Filetype go nmap <leader>goi <Plug>(go-info)
  au Filetype go nmap <leader>god :GoDeclsDir<CR>
  au Filetype go nmap <leader>gou <Plug>(go-run)
  au Filetype go nmap <leader>gor <Plug>(go-rename)
  au Filetype go nmap <leader>got :GoTest!<CR>
  au Filetype go nmap <leader>rt :GoTestFunc!<CR>
  au Filetype go nmap <leader>gom :GoImports<CR>
  au Filetype go nmap <leader>gie <Plug>(go-iferr) 
                            
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END


" Rust
let g:rustfmt_autosave = 1
"let g:rustfmt_fail_silently = 0

augroup ft_rust
  au!
  au BufEnter,BufNewFile,BufRead *.rs :compiler cargo

  au Filetype rust nmap <c-]> <Plug>(rust-def)
  au Filetype rust nmap <leader>rod <Plug>(rust-doc)
augroup END


" Typescript
augroup ft_typescript
  au!

  autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

  au Filetype typescript nmap <c-]> <Plug>(ale_go_to_definition)
  au Filetype typescript setlocal shiftwidth=2 softtabstop=2 expandtab
augroup END


" C
augroup ft_c
  au!
  au BufNewFile,BufRead *.h setlocal filetype=c
  au Filetype c setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  au Filetype c setlocal cinoptions=l1,t0,g0 " This fixes weird indentation of switch/case
augroup END


" Add comment highlighting for json
autocmd FileType json syntax match Comment +\/\/.\+$+

