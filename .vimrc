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
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'chrisbra/improvedft'
Bundle 'arecarn/crunch'
Bundle 'bling/vim-airline'
Bundle 'othree/html5.vim'
Bundle 'othree/html5-syntax.vim'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tomtom/tcomment_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'marijnh/tern_for_vim'

" Some Bundle's I'm considering but have not added:
" Bundle 'SirVer/ultisnips'

filetype plugin indent on

set term=xterm-256color
set t_Co=256
colorscheme molokai

set ignorecase
set smartcase
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:vimwiki_list = [{'path': '~/.vimwiki'}]
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_min_num_chars_for_completion=1
let g:ycm_cache_omnifunc=0

set undodir='/home/thomas/.vim/undo/'
set undofile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

autocmd CursorMoved,CursorHold *.html,*.css,*.js if expand('%') != '' | update | endif
autocmd BufNewFile,BufRead *.wiki nnoremap j gj | nnoremap k gk

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
noremap <Leader>rw :%s/\s*$//g
nnoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>gv
inoremap <C-s> <Esc>:w<CR>a
" I can add 'm' after 'gs' to fix it...
imap gsm <Plug>snipMateNextOrTrigger
smap gsm <Plug>snipMateNextOrTrigger
imap <c-j> <Plug>snipMateNextOrTrigger
smap <c-j> <Plug>snipMateNextOrTrigger
imap <c-k> <Plug>snipMateBack
smap <c-k> <Plug>snipMateBack
imap gsh <Plug>snipMateShow

