colorscheme slate
set encoding=utf8
syntax on
set guioptions-=m
set guioptions-=T

set ts=2
set sts=2
set shiftwidth=2
set expandtab
set autoindent
set number
set nowrap

set nobackup

set wildmode=list:full
set incsearch

vnoremap < <gv
vnoremap > >gv

set showmatch
set nocompatible
set backspace=2        " Поведение клавиш
set termencoding=utf8  " Кодировка терминала
set fileencoding=utf8

set laststatus=2
set splitbelow

set backupdir=~/.vim/backup
set directory=~/.vim/backup

autocmd BufNewFile,BufRead *.php,*.xsl set ts=4 sts=4 shiftwidth=2

"show tabs, EOL etc.
set list
set listchars=tab:»·
set listchars+=trail:·
set endofline

filetype plugin indent on " Enable filetype-specific indenting and plugins

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END
