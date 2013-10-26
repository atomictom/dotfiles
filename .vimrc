" Allow saving of files as sudo when I forgot to start vim using sudo.
set nocompatible
syntax on

cmap w!! %!sudo tee > /dev/null %

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'lsdr/monokai'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-sensible'
Bundle 'Raimondi/delimitMate'
Bundle 'AutoComplPop'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/DrawIt'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-pyref'
Bundle 'vim-scripts/open-pdf.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/CCTree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'boras/gdbvim'
Bundle 'mbbill/undotree'
Bundle 'vim-scripts/CRefVim'
Bundle 'xolox/vim-session'

filetype plugin indent on

set term=xterm-256color
set t_Co=256
colorscheme molokai

set ignorecase
set smartcase
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:vimwiki_list = [{'path': '~/.vimwiki'}]

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for
" quickfix buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't 
" seem to happen.
"autocmd QuickFixCmdPost [^l]* nested cwindow 4
"autocmd QuickFixCmdPost    l* nested lwindow 4

map <Leader>m :silent make!\|redraw!\|cw 4\|wincmd j<CR>
map <Leader>t :tabnew<space>
map <Leader>e :%!
map <Leader>sh :.!sh<CR>
nnoremap <F5> :UndotreeToggle<CR>
map <Leader>s :SaveSession<space>
map <Leader>so :OpenSession<space>
