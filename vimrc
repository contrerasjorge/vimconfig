call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula'  }
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
Plug 'jiangmiao/auto-pairs'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax"

call plug#end()

" coc config
" let g:coc_global_extensions = [
   "\ 'coc-snippets',
     "\ 'coc-pairs',
       "\ 'coc-tsserver',
         "\ 'coc-eslint', 
           "\ 'coc-prettier', 
             "\ 'coc-json', 
               "\ ]
"" from readme
" if hidden is not set, TextEdit might fail.
set hidden
set updatetime=300"

syntax enable
filetype on
filetype plugin on
filetype indent on

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

set mouse+=a

" Indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab


" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

au filetype go inoremap <buffer> . .<C-x><C-o>

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

" Ale
let g:ale_linters = {'go': ['go build', 'gofmt'], 'rust': ['cargo', 'rls']}

" prettier
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx PrettierAsync

" Typescript
augroup ft_typescript
  au!

  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript

  au Filetype typescript nmap <c-]> <Plug>(ale_go_to_definition)
  au Filetype typescript setlocal shiftwidth=4 softtabstop=4 expandtab
augroup END

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

""  Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
    "let col = col('.') - 1
      "return !col || getline('.')[col - 1]  =~# '\s'
    "endfunction

"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"if has('patch8.1.1068')
  "" Use `complete_info` if your (Neo)Vim version supports it.
  "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" :"\<C-g>u\<CR>"
"else
  "imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "else
    "call CocAction('doHover')
  "endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Introduce function text object
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)

"" Use <TAB> for selections ranges.
"" NOTE: Requires 'textDocument/selectionRange' support from the language server.
"" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
""set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


""Mappings using CoCList:
"" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
