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
Bundle 'killphi/vim-ebnf'
Bundle 'michaeljsmith/vim-indent-object'
"Bundle 'nelstrom/vim-textobj-rubyblock'
"Bundle 'tomasr/molokai'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'chrisbra/improvedft'
Bundle 'arecarn/crunch'
Bundle 'bling/vim-airline'

filetype plugin indent on

set term=xterm-256color
set t_Co=256
colorscheme molokai

set ignorecase
set smartcase
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:vimwiki_list = [{'path': '~/.vimwiki'}]
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'

set undodir='/home/thomas/.vim/undo/'
set undofile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

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

noremap <Leader>m :silent make!\|redraw!\|cw 4\|wincmd j<CR>
noremap <Leader>t :tabnew<space>
noremap <Leader>e :!
noremap <Leader>ef :%!
noremap <Leader>sh :.!bash<CR>
noremap <Leader>s :SaveSession<space>
noremap <Leader>so :OpenSession<space>
noremap <Leader>v :tabnew ~/.vimrc
inoremap jk <Esc>
noremap <F5> :UndotreeToggle<CR>
noremap <F4> :NERDTreeToggle<CR>
noremap <Leader>a :normal A
noremap <Leader>o :.w !bash<CR>
noremap <Leader>r :%s///gc<Left><Left><Left><Left>
noremap <Leader>re :%s///gc<Left><Left><Left><Left>
"unmap <Leader>wd
