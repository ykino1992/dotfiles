"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"

" autoclose
" NeoBundle 'Townk/vim-autoclose'

" syntastic
NeoBundle 'scrooloose/syntastic'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
let g:indent_guides_guide_size = 1

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

" かっこいいカラースキーマ
NeoBundle 'w0ng/vim-hybrid'

" Slim用シンタックス
NeoBundle "slim-template/vim-slim"

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

colorscheme hybrid

syntax on

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
