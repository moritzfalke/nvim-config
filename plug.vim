if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


call plug#begin('~/.local/share/nvim/plugged')

" colorscheme
Plug 'joshdick/onedark.vim'

" Fancy start page with recent files, etc
Plug 'mhinz/vim-startify'

" Show trailing whitespace in red
Plug 'bronson/vim-trailing-whitespace'

" Plugin to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" Vim plugin that shows keybindings in popup
Plug 'liuchengxu/vim-which-key'

" Visual register search
Plug 'junegunn/vim-peekaboo'

" Lightweight status line
Plug 'itchyny/lightline.vim'
" ALE indicator for the lightline vim plugin
Plug 'maximbaz/lightline-ale'


" (Un-)comment code
Plug 'tpope/vim-commentary'

" Automatically add 'end' when opening a block
Plug 'tpope/vim-endwise'

" Closes brackets (on <cr>)
Plug 'rstacruz/vim-closer'

" enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth'

" Vim sugar for the UNIX shell commands that need it the most; e.g. :Find, :Wall
Plug 'tpope/vim-eunuch'

" Make Vim persist editing state without fuss
Plug 'kopischke/vim-stay'

" Wrapper of some vim/neovim's :terminal functions
Plug 'kassio/neoterm'

" Secure modeline: https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
Plug 'ciaranm/securemodelines'

" Awesome git wrapper
Plug 'tpope/vim-fugitive'

" Show git diff via Vim sign column.
Plug 'airblade/vim-gitgutter'

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" Sane buffer/window deletion.
Plug 'mhinz/vim-sayonara'

" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Navigation -- Fuzzy find, searching, etc {
" Modern performant generic finder and dispatcher for Vim and NeoVim
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" Helps you win at grep.
Plug 'mhinz/vim-grepper'

" - for netrw current directory
Plug 'tpope/vim-vinegar'

" Improved incremental searching
Plug 'haya14busa/incsearch.vim'

" Run tests directly in vim
Plug 'vim-test/vim-test'

" Markdown {
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }
" }

" JavaScript {
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'mxw/vim-jsx'
" }

Plug 'kana/vim-textobj-user'

" Underscore text-object for Vim
Plug 'lucapette/vim-textobj-underscore'

call plug#end()

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync | q
elseif exists('g:update_plugins') && g:update_plugins
  echo 'Updating plugins...'
  PlugUpdate --sync | q
endif
