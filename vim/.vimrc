if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'rakr/vim-one'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'rust-lang/rust.vim'
call plug#end()


" Map j and k to gj/gk, but only when no count is given
" However, for larger jumps like 6j add the current position to the jump list
" so that you can use <c-o>/<c-i> to jump to the previous position
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

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
set completeopt=menuone,popup
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
set grepprg=rg\ --vimgrep
set foldmethod=syntax
set foldlevel=2
set foldminlines=15

" auto-complete settings
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Show tagbar on F10
nmap <F10> :TagbarToggle<CR>
" Ctrl+Space to show buffer list
nnoremap <C-@> :Buffers<Cr>
" Space+t to show tags
nnoremap <silent> <Space>t :BTags<Cr>

"vim-go
let g:go_test_show_name = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_updatetime = 400
let g:go_fmt_command = "goimports"
let g:go_imports_autosave = 1
let g:go_doc_popup_window = 1
let g:go_def_reuse_buffer = 1
let g:go_fmt_fail_silently = 1
let g:go_gopls_complete_unimported = v:true
let g:go_gopls_matcher = "fuzzy"
let g:go_template_use_pkg = 1
let g:go_addtags_transform = "camelcase"
let g:go_highlight_space_tab_error = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1

" ale
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'rust': ['rustfmt']}
let g:ale_linters = {'go': ['golangci-lint', 'gopls'], 'rust': ['analyzer'], 'text': ['proselint']}
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = "--enable-all --fast"
let g:ale_change_sign_column_color = 1
let g:ale_sign_warning = '❗'
let g:ale_sign_error = '❌'
let g:ale_go_langserver_executable = 'gopls'
let g:ale_set_highlights = 0

" fzf
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = 'down:50%'

" airline
let g:airline#extensions#ale#enabled = 1

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_', 'converters',  ['converter_auto_delimiter', 'remove_overlap'])

" NERDTree
let g:NERDTreeWinPos = "right"

" Tagbar
let g:tagbar_position = "left"
let g:tagbar_compact = 1
let g:tagbar_autopreview = 1


syntax on
filetype plugin indent on
colorscheme nightfly

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
hi SpellBad gui=undercurl guisp=red term=undercurl cterm=undercurl


" Group local module imports separately
autocmd FileType go let b:go_fmt_options = {
    \ 'goimports': '-local ' .
      \ trim(system('{cd '. shellescape(expand('%:h')) .' && go list -m;}')),
    \ }

" Open NERDTree automatically
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

" Quit when NERDTree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show files with :Files``
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Run rg on :Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden -g "!.git/*" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('down:50%', '?'),
  \   <bang>0)

" Run rg excluding go test files on :Rgs
command! -bang -nargs=* Rgs
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "*.go" -g "!*_test.go" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('down:50%', '?'),
  \   <bang>0)
