let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:dein_toml_dir    = expand('~')
  let s:toml      = g:dein_toml_dir . '/.dein.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

call dein#add('Shougo/vimproc.vim', {'build': 'make'})
if dein#check_install()
  call dein#install()
endif


set background=dark
colorscheme gruvbox

syntax on
filetype plugin indent on

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
set expandtab
set smarttab
set autoindent
set tabstop=2 shiftwidth=2 softtabstop=2
set cursorline
set number
set showmatch
set incsearch
set noswapfile
set swapfile
set directory=/tmp
set backup
set backupdir=/tmp
set undofile
set undodir=/tmp
set clipboard&
set clipboard=unnamed
set clipboard^=unnamedplus
set backspace=indent,eol,start

" txtの自動改行解除
autocmd FileType text setlocal textwidth=0

autocmd BufNewFile,BufRead *.{vue} set filetype=javascript
