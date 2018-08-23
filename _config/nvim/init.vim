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
"set foldcolumn=2
set foldlevel=0
set whichwrap=b,s,<,>,[,]

syntax on
set nobackup
set encoding=utf8
set fileencoding=utf8
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set number
set ruler
set imdisable
set hidden

set matchpairs& matchpairs+=<:>
"colorscheme Tomorrow-Night-Eighties

set statusline=%F%m%r%h%w%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%l,%v][%p%%]
set laststatus=2

set conceallevel=2

set packpath^=~/.config/nvim

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

runtime! init/*.vim

colorscheme iceberg

"-----------------------------------------
" skk.vim
" http://peryaudo.hatenablog.com/entry/20100505/1273048637
if !has('gui_running')
    let g:eskk#directory = "~/.eskk"
    let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
    let g:eskk#large_dictionary = { 'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
    let g:eskk#sub_dictionaries = [{ 'path': "~/.eskk/SKK-JISYO.emoji.utf8", 'sorted': 2, 'encoding': 'utf-8' }]
    let skk_use_face = 1
end

"-----------------------------------------
" for vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_no_updatetime = 1

"-----------------------------------------
" markdown-vim
"
let g:markdown_fenced_languages = ['cpp', 'ruby', 'json']
let g:gfm_syntax_emoji_conceal = 1

"-----------------------------------------
" ref
let g:ref_refe_cmd = $HOME.'/.rbenv/shims/refe' "refeコマンドのパス

"-----------------------------------------
" for NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

"-----------------------------------------
" deoplete
let g:deoplete#enable_at_startup = 1

" LanguageServer
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls'],
    \ 'ts': ['typescript-language-server', '--stdio'],
    \ 'rb': ['language_server-ruby']
    \ }
