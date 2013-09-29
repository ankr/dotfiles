" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" UTF-8
scriptencoding utf-8

" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Automatically load view when file is opened.
autocmd BufWinEnter * silent! loadview
"autocmd BufWinLeave * silent! mkview

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" Also don't do it when the mark is in the first line,
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" When entering Insert mode turn of search highlighting,
" and turn it back on again when leaving insert mode.
autocmd InsertEnter * set nohlsearch
autocmd InsertLeave * set hlsearch

" Keep undo history when buffer is closed
if has('persistent_undo')
	set undofile         " Enabling undo on file
	set undolevels=1000  " Number of changes that can be undone
	set undoreload=10000 " Number lines to save for undo on a buffer reload
endif

" Syntax highlight
syntax enable

" Use solarized color scheme
set background=dark
"set background=light

" Enabling mouse if any
if has('mouse')
	set mouse=a
endif

" Various settings
set hidden               " Hide buffers instead of closing them.
set scrolloff=5          " Keep X lines above and below the cursor
set title                " Change terminal title to file path
set directory=/tmp       " Moving swp files out of working dir
"set nobackup             " I use git instead
"set noswapfile           " I use git instead
set virtualedit=onemore  " Allow for cursor beyond last character
set history=500          " Keep 500 lines of command history
set ruler                " Show the cursor position all the time
set showcmd              " Display incomplete commands
set number               " Show line numbers
set numberwidth=4        " Making room for 4 digit line numbers
set showmode             " Display the current mode
set cursorline           " Highlight current line
set linespace=0          " No extra spaces between rows
set showmatch            " Show matching brackets/parenthesis
set incsearch            " Find as you type search
set ignorecase           " Case insensitive search
set smartcase            " Case sensitive when uc present
set hlsearch             " Highlight search terms
set winminheight=0       " Windows can be 0 lines high 
set autoindent           " Indent at the same level of the previous line
set list                 " Show whitespace characters
set wildmenu             " Better command line autocompletion
set wildignore=*~,*.bak  " Only autocomplete *real* files
set laststatus=2         " Always display the status line, even if only one window is displayed
set tabstop=2            " Tab size
set shiftwidth=2         " More tab size
set shiftround           " I am not sure what this do, but everybody has it ;)
set smarttab             " Smart tab
set foldmethod=manual    " I want to control the folding

" More settings
set backspace=indent,eol,start                        " Allow backspacing over everything in insert mode
set listchars=tab:>.,trail:.,extends:#,nbsp:.         " Highlight problematic whitespace
set viewoptions=folds,options,cursor,unix,slash       " better unix / windows compatibility
set statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P " Show buffer number next to file name in status line

" Prevent auto indentation when pasting from clipboard
set pastetoggle=togl

" Prevent lazy pinky on the shift button
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Map the leader to something easier accessible
let mapleader = ","

" Easier moving in tabs and windows
" Use H J K L while holding down Ctrl.
map <C-H> <C-W>h<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_

" In wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Making Y act the same way as D and C
nnoremap Y y$
vnoremap Y y$

" Getting full path of current file
nnoremap F :echo expand('%:p')<Enter>

" Do not exit visual mode when shifting text
vnoremap < <gv
vnoremap > >gv
