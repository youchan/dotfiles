call ddu#custom#patch_global({
    \     "ui": "ff",
    \     "sourceOptions": {
    \         "_": {
    \             "matchers": ["matcher_substring"]
    \         },
    \     },
    \ })

call ddu#custom#patch_local("files", {
    \     "sources": ["file_rec"],
    \     "sourceParams": {
    \         "file_rec": {
    \             "ignoredDirectories": [],
    \         }
    \     },
    \     "sourceOptions": {
    \         "file_rec": {
    \             "maxItems": 50000
    \         }
    \     }
    \ })

autocmd FileType ddu-ff call s:ddu_ff_settings()
function s:ddu_ff_settings() abort
    nnoremap <buffer> <CR> <Cmd>call ddu#ui#do_action('itemAction', {'name': 'open'})<CR>
endfunction

command! DduFiles call ddu#start({"name": "files", "sourceOptions": {"file_rec": {"path": getcwd()}}})
