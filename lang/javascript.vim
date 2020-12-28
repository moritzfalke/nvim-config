augroup config#javascript
  autocmd!
  autocmd FileType javascript setlocal foldmethod=syntax
  autocmd BufRead,BufNewFile .eslintrc setlocal filetype=json
augroup END
