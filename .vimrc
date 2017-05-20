"source: https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"YCM installation: https://github.com/Valloric/YouCompleteMe#installation

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

    Plugin 'tmhedberg/SimpylFold'
    Plugin 'vim-scripts/indentpython.vim'
    
    " Auto complete
    Bundle 'Valloric/YouCompleteMe'

    " Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    " Lint
    Plugin 'scrooloose/syntastic'
    Plugin 'nvie/vim-flake8'

    " Themes
    Plugin 'jnurmine/Zenburn'
    Plugin 'altercation/vim-colors-solarized'

    " NerdTree
    "Plugin 'scrooloose/nerdtree'
    "Plugin 'jistr/vim-nerdtree-tabs'

    " Super Search with Ctrl-Space-P
    Plugin 'kien/ctrlp.vim'  

    " Git Integration
    Plugin 'tpope/vim-fugitive'

    Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

" Use flake8 - LINT
let g:syntastic_python_checkers=["flake8"]
let ignore = '--ignore=E101,E501,E302,E261,E701,E241,E126,E127,E128,W801,W291,E305,E251,W391,W293'
let g:syntastic_python_flake8_args = ignore
let g:syntastic_python_checker_args = ignore

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding, use with 'za' (default)
set foldmethod=indent
set foldlevel=99

"nnoremap <space> za " Enable folding with the spacebar
let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2 |
"    \ set softtabstop=2 |
"    \ set shiftwidth=2 |

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ 

" UltiSnips keys 
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

" YCM options
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<Down>'] "rm TAB to avoid conflicts w UltiSnips
let g:ycm_key_list_previous_completion = ['<Up>'] "NB: Ctrl P is supported by default, use it
map gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>     " goto def key

" FOR YCM - doesn't work fine
    "python with virtualenv support
    "py << EOF
    "python << EOF  "dev find which one works and rm
    "import os
    "import sys
    "if 'VIRTUAL_ENV' in os.environ:
      "project_base_dir = os.environ['VIRTUAL_ENV']
      "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
      "execfile(activate_this, dict(__file__=activate_this))
    "EOF

" Theme options
    if has('gui_running')
      set background=dark
      colorscheme solarized
    else
      colorscheme zenburn
    endif

    call togglebg#map("<F5>")

set encoding=utf-8

let python_highlight_all=1
syntax on

set nu " line #

"set clipboard=unnamedplus "to copy past to ext programs LINUX
set clipboard=unnamed "MAC

set lines=50 columns=120 "default win size

" Powerline setup
set laststatus=2
set term=xterm-256color
set termencoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
let g:Powerline_symbols = 'fancy'
" set guifont=Ubuntu\ Mono

" NERDTREE options
"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
