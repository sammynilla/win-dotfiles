
syntax enable										" Enabled syntax highlighting
set hidden											" Required to keep multiple buffers open
set nowrap											" Display long lines as just one line
set encoding=utf-8							" The encoding displayed
set pumheight=10								" Makes popup menu smaller
set fileencoding=utf-8					" The encoding written to file
set ruler												" Show the cursor position all the time
set cmdheight=2									" More space for displaying messages
set mouse=a											" Enable your mouse
set splitbelow									" Horizontal splits will automatically be below
set splitright									" Vertical splits will automatically be to the right
set t_Co=256										" Support 256 colors
set conceallevel=0							" So we can see `` in markdown files

" Indentation
set tabstop=2										" Insert 2 spaces for a tab
set shiftwidth=2								" Change the number of space characters inserted for indentation
set smarttab										" Makes tabbing smarter. Will realize you have 2 vs 4 space tabs
set expandtab										" Converts tabs to spaces
set smartindent									" Makes indenting smart
set autoindent									" Good auto indentation

set number                      " Line numbers
set showtabline=2               " Always show tabs
set noshowmode                  " Hide --INSERT-- and other things

" Completion & Timeout
set updatetime=300							" Faster completion
set timeoutlen=500							" By default, timeout length is 1000ms

set formatoptions-=cro					" Stop newline continuation of comments
set clipboard=unnamedplus				" Copy and paste between vim and everything else
if has('win32')
  source $VIMRUNTIME/mswin.vim  " Fixes issues with ctrl+c/v for copy and paste.
endif

" Automatically source when writing to init.vim
au! BufWritePost $MYVIMRC source %
