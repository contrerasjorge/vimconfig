call plug#begin('~/.vim/plugged')

Plug 'ThePrimeagen/vim-be-good'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'sjl/tslime.vim'
Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'
Plug 'christoomey/vim-tmux-navigator'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'janko-m/vim-test'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdcommenter'
Plug 'JuliaEditorSupport/julia-vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Theme
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'


" file explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" nvim lsp
Plug 'neovim/nvim-lspconfig'
" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'
" Extensions to built-in LSP, provides type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Lua
Plug 'tjdevries/nlua.nvim'
Plug 'euclidianAce/BetterLua.vim'

" For telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" debuggger
" Plug 'mfussenegger/nvim-dap'

call plug#end()

" You can move anywhere!!!
" set virtualedit=all

" Theme
set termguicolors "enable true colors support
colorscheme onedark
"colorscheme gruvbox
"set background=dark
"let g:gruvbox_contrast_dark = 'hard'

let mapleader = " "

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Give the active window a blue background and white foreground
hi StatusLine ctermfg=15 ctermbg=32 cterm=bold
hi SignColumn ctermfg=255 ctermbg=15

" Highlight search
hi Search     ctermbg=yellow


" move highlight up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Open and source vimrc file
nnoremap <silent> <leader>ev :e ~/.vimrc<CR>
nnoremap <silent> <leader>sv :so ~/.vimrc<CR>


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
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>
nnoremap <leader>fs <cmd>Telescope file_browser<cr>

" File explorer
nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>

" Fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>


"""""""""""Language Settings"""""""""""

" Ale
let g:ale_fixers = {
      \  'javascript': ['eslint'],
      \  'javascript.jsx': ['eslint'],
      \  'typescript': ['eslint'],
      \  'typescriptreact': ['eslint'] 
      \}
let g:ale_fix_on_save = 1


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

" C & C++
augroup ft_c
  au!
  au BufNewFile,BufRead *.h setlocal filetype=c
  au Filetype c setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  au Filetype c setlocal cinoptions=l1,t0,g0 " This fixes weird indentation of switch/case
augroup END

let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4, BraceBreakingStyle: Stroustrup}"']
    \}
let g:neoformat_c_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4, BraceBreakingStyle: Stroustrup}"']
    \}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" JSON color highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:lua << EOF
  local nvim_lsp = require('lspconfig')

  local function opt(scope, key, value)
    local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
    scopes[scope][key] = value
    if scope ~= 'o' then
      scopes['o'][key] = value
    end
  end

  local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
      options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end

  local on_attach = function(client, bufnr)
    require('completion').on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

  end


  local servers = {'pyright', 'gopls', 'rust_analyzer', 'tsserver'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end

  require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_attach = on_attach,

    -- Include globals you want to tell the LSP are real :)
    globals = {
      -- Colorbuddy
      "Color", "c", "Group", "g", "s",
    }
  })

  require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
  }

  -- nvim-dap
  -- map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
  -- map('n', '<leader>dso', '<cmd>lua require"dap".step_over()<CR>')
  -- map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
  -- map('n', '<F5>', '<cmd>lua require"dap".continue()<CR>')

  -- treesitter config
  require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true
    },
  }

  -- telescope fzy
  -- require('telescope').load_extension('fzy_native')

EOF

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

