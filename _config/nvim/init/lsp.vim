if executable('typescript-language-server')
  augroup LspTypeScript
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript'],
        \ })
    autocmd FileType typescript setlocal omnifunc=lsp#complete
  augroup END
endif

if executable('clangd')
  augroup LspCpp
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
    autocmd FileType c,cpp setlocal omnifunc=lsp#complete
  augroup END
endif

let g:lsp_async_completion = 0
