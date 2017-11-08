" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

set clipboard=unnamed
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"colorscheme Tomorrow-Night-Eighties
colorscheme iceberg

set statusline=%F%m%r%h%w%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%l,%v][%p%%]
set laststatus=2

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

runtime! init/*.vim

"-----------------------------------------
" neocomplete
let g:neocomplete#skip_auto_completion_time = '0.2'
let g:neocomplete#enable_at_startup=1

"-----------------------------------------
" for vim-auto-save
let g:auto_save = 1

"-----------------------------------------
" markdown-vim
let g:markdown_fenced_languages = ['cpp', 'ruby', 'json']

"-----------------------------------------
" ref
let g:ref_refe_cmd = $HOME.'/.rbenv/shims/refe' "refeコマンドのパス
"-----------------------------------------
