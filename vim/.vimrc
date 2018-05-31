if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-go', { 'do': 'make' }
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
call plug#end()

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <silent> <Space>f :CtrlP<CR>
nnoremap <silent> <Space>m :CtrlPMixed<CR>
nnoremap <silent> <Space>r :CtrlPMRU<CR>
nnoremap <silent> <C-@> :CtrlPBuffer<CR>

" Make completion work like an IDE
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#rust#racer_binary= $HOME.'/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path= $HOME.'/git/rust/src'
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:ctrlp_working_path_mode = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:NERDTreeWinPos = "right"
let g:tagbar_left = 1
let g:airline_theme='violet'
let g:rustfmt_autosave = 1
let g:ale_linters = {'go': ['gometalinter', 'gofmt'], 'rustr': ['rls','rustfmt']}
let g:ale_go_gometalinter_options = '--fast'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_change_sign_column_color = 1
let g:ale_sign_warning = '❗'
let g:ale_sign_error = '❌'
let g:airline#extensions#ale#enabled = 1

autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType qf wincmd J
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

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
set listchars=tab:┆‧,eol:↲,nbsp:␣,trail:•,extends:❯,precedes:❮
set fillchars+=vert:│

highlight NonText ctermfg=30 guifg=#008787

syntax on
filetype plugin indent on

if (has("termguicolors"))
    set termguicolors
endif

colorscheme space-vim-dark
hi SpecialKey guifg=#3f3f3f
