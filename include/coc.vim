let g:coc_global_extensions = [
      \   'coc-highlight',
      \   'coc-json',
      \   'coc-python',
      \   'coc-snippets',
      \   'coc-tsserver',
      \   'coc-yaml',
      \ ]

autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

let s:languageserver = {}

if executable('bash-language-server')
  let s:languageserver["bash"] = {
        \   "command": "bash-language-server",
        \   "args": ["start"],
        \   "filetypes": ["sh"],
        \   "ignoredRootPaths": ["~"]
        \ }
endif

call coc#config('languageserver', s:languageserver)
