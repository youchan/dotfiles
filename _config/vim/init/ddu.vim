call ddu#custom#patch_global({
  \   'ui': 'ff',
  \   'sources': [
  \     {
  \       'name': 'file_rec',
  \       'params': {
  \         'ignoredDirectories': ['.git', 'node_modules', 'vendor', '.next']
  \       }
  \     },
  \     {
  \       'name': 'gg',
  \     }
  \   ],
  \   'sourceOptions': {
  \     '_': {
  \       'matchers': ['matcher_substring'],
  \     },
  \   },
  \   'kindOptions': {
  \     'file': {
  \       'defaultAction': 'open',
  \     },
  \     'colorscheme': {
  \       'defaultAction': 'set',
  \     },
  \   },
  \   'filterParams': {
  \      'matcher_substring': {
  \          'highlightMatched': 'Search',
  \      },
  \   },
  \ })

call ddu#custom#patch_local('files', {
  \   'sources': ['file_rec'],
  \   'sourceParams': {
  \     'file_rec': {
  \       'ignoredDirectories': [],
  \     }
  \   },
  \   'sourceOptions': {
  \     'file_rec': {
  \       'maxItems': 50000
  \     }
  \   }
  \ })

call ddu#custom#patch_local('gg', {
  \   'sourceParams': {
  \     'gg': {
  \       'args': ['--column', '--no-heading', '--color', 'never'],
  \     },
  \   },
  \ })

autocmd FileType ddu-ff call s:ddu_ff_settings()
function s:ddu_ff_settings() abort
  nnoremap <buffer><silent> q <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer><silent> <CR> <Cmd>call ddu#ui#do_action('itemAction', {'name': 'open'})<CR>
endfunction

command! DduFiles call ddu#start({'name': 'files', 'sourceOptions': {'file_rec': {'path': getcwd()}}})
command! -nargs=1 DduGitGrep call ddu#start({'name': 'gg', 'sources': [{'name': 'gg', 'params': {'input': <f-args>}}]})
command! DduGitGrepCWord call ddu#start({'name': 'gg', 'sources': [{'name': 'gg', 'params': {'input': expand('<cword>')}}]})
