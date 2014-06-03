:colorscheme elflord

set nocompatible
set clipboard=unnamed

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'vim-scripts/buftabs'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'alpaca-tc/alpaca_tags'
call neobundle#end()

" for alpaca_tags


"-----------------------------------------

" for buftabs
" バッファタブにパスを省略してファイル名のみ表示する
let g:buftabs_only_basename=1
" バッファタブをステータスライン内に表示する
let g:buftabs_in_statusline=1
" 現在のバッファをハイライト
"let g:buftabs_active_highlight_group="Visual"
" ステータスライン
set statusline=%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%04l,%04v][%p%%]
" ステータスラインを常に表示
set laststatus=2
"-----------------------------------------

syntax on
set encoding=utf8
set fileencoding=utf8
set list
set number
set ruler

set matchpairs& matchpairs+=<:>

nmap <C-D> <ESC>a<C-R>=strftime("%Y-%m-%d")<CR><ESC>
nmap <C-T> <ESC>a<C-R>=strftime("%H:%M:%S")<CR><ESC>
map <LEFT> <ESC>:bp<CR>
map <RIGHT> <ESC>:bn<CR>
map <SPACE>d <ESC>:bd<CR>

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
