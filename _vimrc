:colorscheme elflord

set nocompatible
set clipboard=unnamed
set fileencodings=utf-8,cp932,sjis,iso-2022-jp,euc-jp
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

augroup vimrc
    autocmd! filetype perl setlocal shiftwidth=4 tabstop=2 softtabstop=2
    autocmd! filetype ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd! filetype haml setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd! filetype html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd! filetype css  setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd! filetype scss  setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd! filetype coffee  setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd! filetype feature  setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" viminfo
" http://vimwiki.net/?%27viminfo%27
set viminfo='50,\"1000,:0,n~/.vim/viminfo

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'vim-scripts/buftabs'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'basyura/unite-rails'
NeoBundle 'tyru/skk.vim'

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
    \ 'depends': ['Shougo/vimproc', 'Shougo/unite.vim'],
    \ 'autoload' : {
    \   'commands' : ['Tags', 'TagsUpdate', 'TagsSet', 'TagsBundle', 'TagsCleanCache'],
    \   'unite_sources' : ['tags']
    \ }}

NeoBundleLazy 'alpaca-tc/beautify.vim', {
    \ 'autoload' : {
    \   'commands' : [
    \     {
    \       'name' : 'Beautify',
    \       'complete' : 'customlist,beautify#complete_options'
    \     }
    \ ]
    \ }}

NeoBundleLazy 'alpaca-tc/alpaca_rails_support', {
     \ 'depends' : ['Shougo/neocomplete.vim', 'tpope/vim-rails', 'Shougo/vimproc', 'Shougo/unite.vim'],
     \ 'autoload': {
     \   'insert' : 1,
     \   'unite_sources' : 'rails_support/locales',
     \   'commands' : [
     \     'RSCreateRoutesCache', 'RSCleanCache',
     \     'RSShowLocale', 'RSCreateLocaleCache',
     \   ]
     \ }}
call neobundle#end()

"-----------------------------------------
" neocomplete
let g:neocomplete#enable_at_startup=1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"-----------------------------------------


"-----------------------------------------
" alpaca_tags
" ~/.ctagsにctagsの設定ファイルを設置します。現在無い人は、このディレクトリ内の.ctagsをコピーしてください。
" 適切なlanguageは`ctags --list-maps=all`で見つけてください。人によりますので。
let g:alpaca_update_tags_config = {
    \ '_' : '-R --sort=yes --languages=-js,html,css',
    \ 'ruby': '--languages=+Ruby',
    \ }

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
augroup AutoSyntastic
    autocmd!
    autocmd  BufWritePost * SyntasticCheck
augroup END
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

inoremap <C-D> <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <C-E> <C-R>=strftime("%H:%M:%S")<CR>
nnoremap <C-G> :GStatus<CR>
nnoremap <C-P> :bp<CR>
nnoremap <C-N> :bn<CR>
nnoremap <C-K> <c-u>
nnoremap <C-J> <c-d>
nnoremap <C-B>d :bd<CR>
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

vnoremap ; $h
vnoremap a ggvvG$

nnoremap <silent>m :<C-u>call <sid>AutoMarkrement()<CR>

noremap [unite] <NOP>
nmap <SPACE> [unite]
nnoremap [unite]m :Unite mark<CR>
nnoremap [unite]b :Unite buffer<CR>
nnoremap [unite]f :Unite file<CR>
nnoremap [unite]rm :Unite rails/model<CR>
nnoremap [unite]rc :Unite rails/controller<CR>
nnoremap [unite]rv :Unite rails/view<CR>
nnoremap [unite]rj :Unite rails/javascript<CR>
nnoremap [unite]rs :Unite rails/stylesheet<CR>
nnoremap [unite]gb :Unite giti/branch<CR>
nnoremap [unite]gs :Unite giti/status<CR>
nnoremap [unite]gl :Unite giti/log<CR>

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setf markdown

au BufRead,BufNewFile *.hamlc set filetype=haml
au BufRead,BufNewFile *.hamlc setf haml
