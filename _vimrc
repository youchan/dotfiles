" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

set background=dark
set t_Co=256
"colorscheme Tomorrow-Night-Eighties
colorscheme iceberg

set clipboard=unnamed
set fileencodings=utf-8,cp932,sjis,iso-2022-jp,euc-jp
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set nofoldenable

augroup vimrc
    autocmd!
    autocmd filetype perl setlocal shiftwidth=4 tabstop=2 softtabstop=2
    autocmd filetype ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd filetype haml setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd filetype html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd filetype css  setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd filetype scss  setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd filetype javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd filetype coffee  setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd filetype feature  setlocal shiftwidth=2 tabstop=2 softtabstop=2

    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.hamlc set filetype=haml
    autocmd BufNewFile,BufRead *.jb set filetype=ruby

    autocmd QuickFixCmdPost *grep* cwindow
augroup END

" viminfo
" http://vimwiki.net/?%27viminfo%27
set viminfo='50,\"1000,:0,n~/.vim/viminfo

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'chrisbra/Colorizer'
NeoBundle 'chrisbra/Recover.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-afterimage'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/eskk.vim'
NeoBundle 'tyru/skkdict.vim'
NeoBundle 'tyru/caw.vim'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'wakatime/vim-wakatime'
NeoBundle 'szw/vim-tags'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'Konfekt/FastFold'

NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'basyura/unite-rails'
NeoBundle 'haya14busa/incsearch.vim'

NeoBundleLazy 'kannokanno/previm', {
    \ 'autoload' : {
    \   'commands' : [ 'PrevimOpen' ]
    \ }}

NeoBundleLazy 'AndrewRadev/inline_edit.vim', {
    \ 'autoload' : {
    \   'commands' : [ 'InlineEdit' ]
    \ }}

NeoBundleLazy 'lambdalisue/vim-gita', {
    \ 'autoload': {
    \   'commands': ['Gita'],
    \}}

NeoBundleLazy 'scrooloose/syntastic', {
    \ 'autoload' : {
    \   'commands': ['SyntasticCheck']
    \}}

"
NeoBundleLazy 'alpaca-tc/beautify.vim', {
    \ 'autoload' : {
    \   'commands' : [
    \     {
    \       'name' : 'Beautify',
    \       'complete' : 'customlist,beautify#complete_options'
    \     }
    \ ]
    \ }}

NeoBundleLazy 'airblade/vim-gitgutter', {
    \ 'autoload' : {
    \   'commands' : [ 'GitGutterEnable' ]
    \ }}
call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"-----------------------------------------
" neocomplete
let g:neocomplete#skip_auto_completion_time = '0.2'
let g:neocomplete#enable_at_startup=1

"if !exists('g:neocomplete#force_omni_input_patterns')
    "let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"-----------------------------------------


"-----------------------------------------
" for vim-auto-save
let g:auto_save = 1
"-----------------------------------------

"-----------------------------------------
" alpaca_tags
" ~/.ctagsにctagsの設定ファイルを設置します。現在無い人は、このディレクトリ内の.ctagsをコピーしてください。
" 適切なlanguageは`ctags --list-maps=all`で見つけてください。人によりますので。
"let g:alpaca_update_tags_config = {
    "\ '_' : '-R --sort=yes --languages=-js,html,css',
    "\ 'ruby': '--languages=+Ruby',
    "\ }

"augroup AlpacaTags
    "autocmd!
    "if exists(':Tags')
        "autocmd BufWritePost * TagsUpdate ruby
        "autocmd BufWritePost Gemfile TagsBundle
    "endif
"augroup end

nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'
"-----------------------------------------


"-----------------------------------------
" buftabs
" バッファタブにパスを省略してファイル名のみ表示する
let g:buftabs_only_basename = 1
" バッファタブをステータスライン内に表示する
"let g:buftabs_in_statusline=1
" 現在のバッファをハイライト
"let g:buftabs_active_highlight_group="Visual"
" ステータスライン
"set statusline=%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%04l,%04v][%p%%]
set statusline=%F%m%r%h%w%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%l,%v][%p%%]
" ステータスラインを常に表示
set laststatus=2
"-----------------------------------------


"-----------------------------------------
" indentLine
let g:indentLine_color_term = 23
let g:indentLine_faster = 1
"-----------------------------------------
"

"-----------------------------------------
" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_mode_map = {'mode': 'passive'} 
" augroup AutoSyntastic
"     autocmd!
"     autocmd  BufWritePost * SyntasticCheck
" augroup END
"-----------------------------------------

"-----------------------------------------
" vim-tags
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"
"-----------------------------------------

"-----------------------------------------
" mark auto reg
" http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif

function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif

    call Vm_toggle_sign()
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction
"-----------------------------------------


"-----------------------------------------
" previm setting
let g:previm_open_cmd = "open -a 'Google Chrome'"
"-----------------------------------------

"-----------------------------------------
" markdown-vim
let g:markdown_fenced_languages = ['ruby']
"-----------------------------------------
"
let g:ref_refe_cmd = $HOME.'/.rbenv/shims/refe' "refeコマンドのパス

"-----------------------------------------
" skk.vim
" http://peryaudo.hatenablog.com/entry/20100505/1273048637
if !has('gui_running')
    " let skk_jisyo = '~/.skk-jisyo'
    " let skk_large_jisyo = '~/Library/Application Support/AquaSKK/SKK-JISYO.L'
    " let skk_auto_save_jisyo = 1
    " let skk_keep_state = 1
    " let skk_egg_like_newline = 1
    " let skk_show_annotation = 1
    let g:eskk#directory = "~/.eskk"
    let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
    let g:eskk#large_dictionary = { 'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
    let skk_use_face = 1
end
"-----------------------------------------

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

"let g:giti_log_pretty_format='%h %s (%an)%d'

syntax on
set encoding=utf8
set fileencoding=utf8
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set number
set ruler
set imdisable
set hidden

set matchpairs& matchpairs+=<:>

hi SpecialKey ctermfg=18

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

inoremap <C-D> <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <C-E> <C-R>=strftime("%H:%M:%S")<CR>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-H> <BS>
nnoremap ; $
nnoremap \ @
nnoremap <C-P> :bp<CR>
nnoremap <C-N> :bn<CR>
nnoremap <C-K> <C-U>
nnoremap <C-J> <C-D>
nnoremap <C-B>d :bd<CR>
nnoremap <C-D> :bd<CR>
nnoremap <C-B><C-D> :bd!<CR>
nnoremap <C-B>1 <ESC>:b1<CR>
nnoremap <C-B>2 <ESC>:b2<CR>
nnoremap <C-B>3 <ESC>:b3<CR>
nnoremap <C-B>4 <ESC>:b4<CR>
nnoremap <C-B>5 <ESC>:b5<CR>
nnoremap <C-B>6 <ESC>:b6<CR>
nnoremap <C-B>7 <ESC>:b7<CR>
nnoremap <C-B>8 <ESC>:b8<CR>
nnoremap <C-B>9 <ESC>:b9<CR>
nnoremap <C-B>0 <ESC>:b10<CR>

nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <Up> <Plug>(yankround-prev)
nmap <Down> <Plug>(yankround-next)

vnoremap ; $h
vnoremap a ggvvG$
vnoremap <C-K> <C-U>
vnoremap <C-J> <C-D>

nnoremap <silent>m :<C-u>call <sid>AutoMarkrement()<CR>

nnoremap [unite] <NOP>
nmap <Space> [unite]
nnoremap [unite]m :Unite mark<CR>
nnoremap [unite]b :Unite buffer<CR>
nnoremap [unite]f :VimFiler -split -horizontal -force-quit<CR>
nnoremap [unite]ff :VimFiler -split -simple -winwidth=35 -no-quit<CR>
nnoremap [unite]rm :Unite rails/model<CR>
nnoremap [unite]rc :Unite rails/controller<CR>
nnoremap [unite]rv :Unite rails/view<CR>
nnoremap [unite]rj :Unite rails/javascript<CR>
nnoremap [unite]rs :Unite rails/stylesheet<CR>
nnoremap [unite]gb :Gita blame<CR>
nnoremap [unite]gs :Gita status<CR>
nnoremap [unite]gl :Gita log<CR>
nmap [unite]gg :Unite giti/grep<CR>
nmap [unite]ggp :Unite giti/grep<CR><C-R>"<CR>
nmap [unite]gg* yiw:Unite giti/grep<CR><C-R>"<CR>

let mapleader = ","

" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

