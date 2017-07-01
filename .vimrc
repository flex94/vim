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

	" Interface
	Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
	Plugin 'tmhedberg/SimpylFold'

	" Auto complete
	Bundle 'Valloric/YouCompleteMe'
	Plugin 'marijnh/tern_for_vim' "for js

	"Auto close brackets
	Plugin 'jiangmiao/auto-pairs'

	"Commands for surroundings
	Plugin 'tpope/vim-surround'

	" Delete buffer w/o closing win (:BD)
	Plugin 'qpkorr/vim-bufkill'
	
	" Snippets
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'

	" Lint
	Plugin 'scrooloose/syntastic'
	Plugin 'nvie/vim-flake8'

	" Themes
	Plugin 'jnurmine/Zenburn'
	Plugin 'trevordmiller/nova-vim'
	Plugin 'joshdick/onedark.vim'

	" NerdTree
	Plugin 'scrooloose/nerdtree'
	Plugin 'jistr/vim-nerdtree-tabs'
	Plugin 'scrooloose/nerdcommenter' " [count]\c<space> toggle comment

	" Super Search with Ctrl-Space-P
	Plugin 'kien/ctrlp.vim'  

	" Git Integration
	Plugin 'tpope/vim-fugitive'

	" Python
	Plugin 'vim-scripts/indentpython.vim'

	" Web/JS Syntax higlight
	Plugin 'pangloss/vim-javascript' "js
	Plugin 'mxw/vim-jsx' "jsx
	Plugin 'leshill/vim-json' "json
	Plugin 'othree/html5.vim' "html
	Plugin 'hail2u/vim-css3-syntax' "css

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Lints
let g:syntastic_python_checkers=["flake8"]
let ignore = '--ignore=E501,E302,E241,E126,E127,E128,W291,E305,W391,W293'
let g:syntastic_python_flake8_args = ignore
let g:syntastic_python_checker_args = ignore

let g:syntastic_javascript_checkers = ['eslint']

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Enable folding, use with 'za' (default)
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
"nnoremap <space> za " Enable folding with the spacebar

"Python options
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let python_highlight_all=1
syntax on

"Web options
au BufNewFile,BufRead *.js,*.jsx,*.html,*.css,*.json
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ 

" UltiSnips keys 
let g:UltiSnipsExpandTrigger="<C-_>" "ctrl /
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

" YCM options
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_key_list_select_completion = ['<Down>'] "rm TAB to avoid conflicts w UltiSnips
"let g:ycm_key_list_previous_completion = ['<Up>'] "NB: Ctrl P is supported by default, use it
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
"colorscheme nova
"colorscheme zenburn
colorscheme onedark

"Switch buffer with F5
:nnoremap <F5> :buffers<CR>:buffer<Space>

"Run current script with python3
:nnoremap <F9> :!ipython3 %<CR>

"Clipboard settings - to copy paste to ext progrms
	if has("unix") "linux
		set clipboard=unnamedplus 
	endif
	if has("macunix") "mac
		set clipboard=unnamed 
	endif

" Other options
set hidden "no need to save a buffer before switching
set encoding=utf-8
set nu " line #
set lines=50 columns=120 "default win size
"lower case search are case-insensitive
	set ignorecase
	set smartcase 

" Powerline setup
set laststatus=2
set term=xterm-256color
set termencoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
let g:Powerline_symbols = 'fancy'
" set guifont=Ubuntu\ Mono

" NERDTREE options
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1 " Start NERDTree Tabs automatically 
"enable/disable with \n
	:nnoremap <leader>n :NERDTreeTabsToggle<CR> 
