if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'liuchengxu/space-vim-dark'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'jiangmiao/auto-pairs'
Plug 'rakr/vim-one'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <C-@> :Buffers<Cr>
nnoremap <silent> <Space>t :BTags<Cr>

" Make completion work like an IDE
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:omni_sql_no_default_maps = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#builtin_objects = 1
let g:deoplete#sources#go#unimported_packages = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_command = "golangci-lint"
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_test_show_name = 1
let g:go_fmt_fail_silently = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:NERDTreeWinPos = "right"
let g:tagbar_left = 1
let g:airline_theme='one'
let g:rustfmt_autosave = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_linters = {'go': ['golangci-lint', 'gopls'], 'rust': ['rls','rustfmt'], 'proto': ['prototool-lint'], 'text': ['proselint']}
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = "--enable-all --fast"
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_change_sign_column_color = 1
let g:ale_sign_warning = '❗'
let g:ale_sign_error = '❌'
let g:ale_go_langserver_executable = 'gopls'
let g:airline#extensions#ale#enabled = 1

call deoplete#custom#option('smart_case', v:true)
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufread,bufnewfile *.asm set filetype=nasm
autocmd bufwritepost *.asm silent !nasmfmt %

autocmd FileType qf wincmd J
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType md,rst,tex,text,go,rust setlocal spell spelllang=en_gb

set nocompatible
set lazyredraw
set bg=dark
set t_Co=256
set history=500
set number ruler
set incsearch
set hlsearch
set smartcase
set selectmode=key
set modeline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoread
set encoding=utf-8
set scrolloff=3
set autoindent
set autoread
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set colorcolumn=120
set completeopt=longest,menuone
set updatetime=100
set showbreak=↪\
set listchars=tab:┆‧,space:‧,eol:↲,nbsp:␣,trail:•,extends:❯,precedes:❮
set fillchars+=vert:│
set undodir=~/.vim/data/undo//
set backupdir=~/.vim/data/backup//
set directory=~/.vim/data/swap//
set undofile
set clipboard=unnamed
set splitright
set splitbelow
set termguicolors
set mouse=a
set ttymouse=sgr
"set spell spelllang=en_gb

syntax on
filetype plugin indent on

colorscheme one

hi SpellBad cterm=underline gui=undercurl ctermfg=Red guifg=Red


call deoplete#custom#source('_', 'converters', ['converter_auto_delimiter', 'converter_remove_overlap', 'converter_truncate_abbr', 'converter_truncate_menu', 'converter_auto_paren'])

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!vendor/*" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* Rgs
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!*_test.go" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
