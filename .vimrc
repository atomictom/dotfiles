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
"Bundle 'AutoComplPop'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vimwiki/vimwiki'
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
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'ivanov/vim-ipython'
Bundle 'jpalardy/vim-slime'
Bundle 'vim-voom/VOoM'

" Some Bundle's I'm considering but have not added:
" Bundle 'SirVer/ultisnips'

filetype plugin indent on

set term=xterm-256color
set t_Co=256
colorscheme molokai

set ignorecase
set smartcase
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:vimwiki_list = [{'path': '~/.vimwiki'}]
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_min_num_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open=1
let g:yankring_history_dir = '~/.vim'
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_update_on_write = 2
let g:gist_open_browser_after_post = 1

set undodir='/home/thomas/.vim/undo/'
set undofile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

augroup vimrc
	" Delete all autocommands in this group (so we don't set them twice...)
	autocmd!
	" Auto save html, css, and js files whenever possible (for live.js)
	autocmd CursorMoved,CursorHold *.html,*.css,*.js if expand('%') != '' | update | endif
	" Call appropriate functions for each filetype to do multiple things
	autocmd BufNewFile,BufRead *.wiki call s:VimwikiAutocommands()
	autocmd BufNewFile,BufRead *.java call s:JavaAutocommands()
augroup END

function s:VimwikiAutocommands()
	nnoremap j gj
	nnoremap k gk
	setlocal linebreak
	let g:airline#extensions#whitespace#checks = ['trailing']
endfunction

function s:JavaAutocommands()
	abbreviate print System.out.println(
endfunction

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
noremap <F9> :YRShow<CR>
noremap <F4> :NERDTreeToggle<CR>
noremap <Leader>a :normal A
noremap <Leader>o :.w !bash<CR>
noremap <Leader>r :s///gc<Left><Left><Left><Left>
noremap <Leader>re :%s///gc<Left><Left><Left><Left>
noremap <Leader>rw :%s/\s*$//g
noremap <Leader>rwe :s/\s*$//g
nnoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>gv
inoremap <C-s> <Esc>:w<CR>a
noremap <M-Right> gt
noremap <M-Left> gT
noremap <C-k> gt
noremap <C-j> gT
" I can add 'm' after 'gs' to fix it...
imap gsm <Plug>snipMateNextOrTrigger
smap gsm <Plug>snipMateNextOrTrigger
imap <c-j> <Plug>snipMateNextOrTrigger
smap <c-j> <Plug>snipMateNextOrTrigger
imap <c-k> <Plug>snipMateBack
smap <c-k> <Plug>snipMateBack
imap gsh <Plug>snipMateShow
