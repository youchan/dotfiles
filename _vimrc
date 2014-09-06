:colorscheme elflord

set nocompatible
set clipboard=unnamed
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

augroup vimrc
autocmd! FileType perl setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType haml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType scss  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType coffee  setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

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
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/syntastic'

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
"augroup END

nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'
"-----------------------------------------

"-----------------------------------------
" buftabs
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

"-----------------------------------------
" indentLine
let g:indentLine_color_term=23
"-----------------------------------------

"-----------------------------------------
" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {'mode': 'passive'} 
augroup AutoSyntastic
    autocmd!
    autocmd  BufWritePost * SyntasticCheck
augroup END
"-----------------------------------------

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

nmap <C-D> <ESC>a<C-R>=strftime("%Y-%m-%d")<CR><ESC>
nmap <C-T> <ESC>a<C-R>=strftime("%H:%M:%S")<CR><ESC>
nmap <C-S> <ESC>:Gstatus<CR><ESC>
map <C-P> <ESC>:bp<CR>
map <C-N> <ESC>:bn<CR>
map <C-B>d <ESC>:bd<CR>
map <C-B><C-D> <ESC>:bd!<CR>
map <C-B>1 <ESC>:b1<CR>
map <C-B>2 <ESC>:b2<CR>
map <C-B>3 <ESC>:b3<CR>
map <C-B>4 <ESC>:b4<CR>
map <C-B>5 <ESC>:b5<CR>
map <C-B>6 <ESC>:b6<CR>
map <C-B>7 <ESC>:b7<CR>
map <C-B>8 <ESC>:b8<CR>
map <C-B>9 <ESC>:b9<CR>
map <C-B>0 <ESC>:b10<CR>
map <C-S> <ESC>:SyntasticCheck

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setf markdown
