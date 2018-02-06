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

tnoremap <silent> <C-[> <C-\><C-n>
