" coc.nvim
imap <C-j> <Plug>(coc-snippets-expand-jump)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
inoremap <silent><expr> <M-space> coc#refresh()

" ALE
nmap <silent> <M-p> <Plug>(ale_previous_wrap)
nmap <silent> <M-n> <Plug>(ale_next_wrap)

" Eanble completion with tab/shift-tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Extra commentary mappings
xmap <c-_>  <Plug>Commentary
omap <c-_>  <Plug>Commentary
nmap <c-_>  <Plug>CommentaryLine

" Mimic behavior from D, C
nnoremap Y y$

vnoremap > >gv
vnoremap < <gv

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Save with enter
function! keybindings#should_save_on_enter()
  return bufname('%') !=# 'swoopBuf' && empty(&buftype)
endfunction
nnoremap <silent> <expr> <CR> keybindings#should_save_on_enter() ? ':w<CR>' : '<CR>'

" Escape to clear search
nnoremap <silent> <esc> :noh<cr>

" Close and delete buffer
nnoremap <silent> <M-q> :Sayonara<cr>

" Copy to system clipboard
vnoremap Y "+y

" Disable plugin mappings
let g:gitgutter_map_keys = 0

" Current file's path in command mode
cnoremap <expr> %% expand('%:h').'/'

nnoremap <silent> <c-p> :Clap!! files<CR>

" Leader mappings {{{
" Leader is <Space>
let g:mapleader=' '
let g:maplocalleader = ','

nnoremap <silent><nowait> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent><nowait> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent><nowait> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent><nowait> <localleader> :<c-u>WhichKeyVisual ','<CR>

call which_key#register('<Space>', "g:leader_key_map")

let g:leader_key_map=  {}

let g:leader_key_map[' '] = {
      \ 'name': '+general',
      \ 's': ['Startify',      'Home Buffer'],
      \ 'c': [':Clap command', 'Search commands'],
      \ 'a': [':Clap colors',  'Search colorshcemes'],
      \ }

let g:leader_key_map.t = {
      \ 'name': '+testing',
      \ 't': [':TestNearest', 'Run Nearest'],
      \ '.': [':TestLast',    'Run Last'],
      \ 'f': [':TestFile',    'Run File'],
      \ 's': [':TestSuite',   'Run Suite'],
      \ 'g': [':TestVisit',   'Goto last ran test'],
      \ }

let g:leader_key_map.f = {
      \ 'name': '+files',
      \ 'f': [':Clap!! files',          'File Search'],
      \ 'h': [':Clap!! files --hidden', 'File Search (hidden)'],
      \ 'o': [':Clap buffers',        'Open Buffer Search'],
      \ 'm': [':Clap history',        'Recent Files Search'],
      \ '.': ['<c-^>',                'Goto Last Buffer'],
      \ }

nmap <silent> <leader>f- :execute(':Clap filer ' . expand('%:h'))<CR>
let g:leader_key_map.f['-'] = 'File Browser'

let g:leader_key_map.h = {
      \ 'name': '+hunks',
      \ 't': [':GitGutterToggle',             'Toggle Git Gutter'],
      \ 'p': ['<Plug>(GitGutterPreviewHunk)', 'Preview Hunk'],
      \ 's': ['<Plug>(GitGutterStageHunk)',   'Stage Hunk'],
      \ 'u': ['<Plug>(GitGutterUndoHunk)',    'Undo Hunk'],
      \ }

let g:leader_key_map.g = { 'name': '+git' }
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Clap commits<CR>
nnoremap <silent> <leader>gk :Clap bcommits<CR>
nnoremap <silent> <leader>gb :Gblame<CR>

let g:leader_key_map.s = {
      \ 'name': '+search',
      \ 'g': ['Grepper',            'Find in directory (quickfix)'],
      \ 'f': [':Clap grep ',        'Find in directory (live)'],
      \ 't': [':Clap tags coc',     'Find tags'],
      \ 'l': [':Clap lines',        'Find lines in open files'],
      \ 'b': [':Clap blines',       'Find lines in current buffer'],
      \ 'p': ['<Plug>CtrlSFPrompt', 'Find in directory (ctrlsf)'],
      \ }

let g:leader_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd': ['bd',            'Delete Buffer'],
      \ 'h': ['Startify',      'Home Buffer'],
      \ 'l': ['b#',            'Last Buffer'],
      \ 'n': ['bnext',         'Next Buffer'],
      \ 'p': ['bprevious',     'Previous Buffer'],
      \ 's': [':Clap buffers', 'Search Buffer'],
      \ }

let g:leader_key_map.l = {
      \ 'name': '+language-server',
      \ 'k': [':call CocAction("doHover")',    'Hover'],
      \ 's': [':Clap tags',                    'Symbols'],
      \ 't': [':Vista!!',                      'Tag Bar'],
      \ }

nmap <silent> <leader>la <Plug>(coc-codeaction)
vmap <silent> <leader>la <Plug>(coc-codeaction-selected)
let g:leader_key_map.l.a = 'Code Action'

nmap <silent> <leader>l= <Plug>(coc-format)
vmap <silent> <leader>l= <Plug>(coc-format-selected)
let g:leader_key_map.l['='] = 'Code Format'

nmap <silent> <leader>lr <Plug>(coc-rename)
let g:leader_key_map.l.r = 'Rename'

nmap <silent> <leader>lf <Plug>(coc-fix-current)
let g:leader_key_map.l.f = 'Autofix Current'

let g:leader_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd': ['bd',            'Delete Buffer'],
      \ 'h': ['Startify',      'Home Buffer'],
      \ 'l': ['b#',            'Last Buffer'],
      \ 'n': ['bnext',         'Next Buffer'],
      \ 'p': ['bprevious',     'Previous Buffer'],
      \ 's': [':Clap buffers', 'Search Buffer'],
      \ }

let g:leader_key_map.y = {
      \ 'name' : '+yanking' ,
      \ 'y' : [':Clap yanks',     'Yank history'],
      \ 'r' : [':Clap registers', 'Vim registers'],
      \ }

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)
