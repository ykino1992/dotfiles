" ENV
let $NVIM_CACHE_HOME = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $NVIM_CONFIG_HOME = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $NVIM_DATA_HOME = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

let g:python_host_prog = $PYENV_ROOT . '/shims/python'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

" プラグインを読み込む
function! s:load_plugins() abort
  let s:path = expand('$NVIM_CONFIG_HOME/nvim/plugins.vim')
  execute 'source' fnameescape(s:path)
endfunction

call s:load_plugins()


" 各種設定
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
