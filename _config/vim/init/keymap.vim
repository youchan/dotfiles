map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map a> <Plug>(textobj-indent-a)
map i> <Plug>(textobj-indent-i)

noremap <Up> gk
noremap <Down> gj

inoremap <C-D> <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <C-E> <C-R>=strftime("%H:%M:%S")<CR>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-H> <BS>
nnoremap ; $
nnoremap <C-H> 0
nnoremap \ @
nnoremap <C-P> :bp<CR>
nnoremap <C-N> :bn<CR>
noremap <C-K> <C-U>
noremap <C-J> <C-D>
nnoremap <C-B>d :bd<CR>
nnoremap <C-X> :bd<CR>
nnoremap <C-B><C-X> :bd!<CR>
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

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

noremap <silent> <ESC><ESC> :<C-u> set hlsearch!<CR>

nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
"nmap <Up> <Plug>(yankround-prev)
"nmap <Down> <Plug>(yankround-next)
nnoremap yy y$

vnoremap ; $h
vnoremap <C-H> 0

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

map <Leader>r :set filetype=ruby<CR>
nnoremap <Leader>d :<C-u>e ~/diary/=strftime("%H:%M:%S").md
