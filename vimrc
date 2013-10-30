".vimrc
"
" Some references
" http://vimdoc.sourceforge.net/htmldoc/options.html
"

" use Vim settings. This must be first, because it changes other options
set nocompatible

" change the leader to be a comma vs slash
let mapleader=","

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" ctrl-jklm for fast window navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" run pep8
let g:pep8_map='<leader>8'

" load pathogen with docs for all plugins
filetype off
call pathogen#incubate()
call pathogen#helptags()

" switch syntax highlighting on
syntax on

" try to detect filetypes
filetype on

" enable file type detection and do language-dependent indenting
filetype plugin indent on

" Open NerdTree
"map <leader>n :NERDTreeToggle<CR>

" Open CtrlP
"map <leader>f :CtrlP<CR>
"map <leader>b :CtrlPBuffer<CR>

" show line numbers.
set number
set numberwidth=1            " only 1 column (and 1 space) while possible

" show title in console title bar
set title

" don't bell or blink
set noerrorbells
set vb t_vb=

""" insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " keep a small completion window

""" moving around/editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " avoid moving cursor to BOL when jumping around
set virtualedit=block       " cursor move past the last char in <C-v> mode
set backspace=2             " backspacing over autoindent, EOL, and BOL
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set showmatch               " when bracket inserted, jump to matching one

" don't outdent hashes
inoremap # #

set textwidth=79            " maximum width of text that is being inserted

" c: auto-wrap comments using textwidth
set formatoptions=c

""" messages, info, status
set ls=2                    " allways show status line
set confirm                 " Y-N-C prompt if closing with unsaved changes
set showcmd                 " show incomplete commands as I type
set report=0                " : commands always print changed line count
set shortmess+=a            " use [+]/[RO]/[w] for modified/readonly/written
set laststatus=2            " always show statusline, even if only 1 window
"set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list

""" searching and patterns
set ignorecase              " default to using case insensitive searches
set smartcase               " unless uppercase letters are used
set smarttab                " handle tabs more intelligently
set incsearch               " incrementally search while typing a /regex

" toggle paste mode
set pastetoggle=<F8>

" disable line numbers
nnoremap <F9> :set nonumber<CR>  

" try to use colors that look good on a dark background
set background=dark

" enable 256 colors
set t_Co=256

colorscheme molokai
let g:molokai_original = 1

" remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" configure SuperTab with c-space instead tab
let g:SuperTabMappingForward = '<nul>'
let g:SuperTabMappingBackward = '<s-nul>'

" configure tab completion to be context sensitive
let g:SuperTabDefaultCompletionType = "context"

""" FileType specific changes
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Bash/Sh
au FileType sh setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent cinwords=if,elif,else,for,while

" PHP
au FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent

" Compile functions
autocmd FileType python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd FileType c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

" add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

if exists("&colorcolumn")
   set colorcolumn=78
endif

