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

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  let g:dein_toml_dir    = expand('~')
  let s:toml      = g:dein_toml_dir . '/.dein.toml'
  " let s:lazy_toml      = g:dein_toml_dir . '/.dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  " call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

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
set nocursorline
set number
set showmatch
set incsearch
set noswapfile
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

" vue用
autocmd BufNewFile,BufRead *.{vue} set filetype=html

set laststatus=2
set matchtime=1
set display=lastline


"ファイルタイプの検索を有効にする
filetype plugin on
"ファイルタイプに合わせたインデントを利用
filetype indent on
"sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
autocmd FileType elm setlocal sw=4 sts=4 ts=4 et
