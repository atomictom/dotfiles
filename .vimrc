" Allow saving of files as sudo when I forgot to start vim using sudo.
set nocompatible
syntax on

cmap w!! %!sudo tee > /dev/null %

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle allows me to install new addons in vim using this "Bundle" syntax
Bundle 'gmarik/vundle'
" Monokai is the color theme I use with vim
Bundle 'lsdr/monokai'
" Uses ctags and shows various tags in a "tagbar" window, use F3 to activate
Bundle 'majutsushi/tagbar'
" A set of nice defaults for vim, don't need to do anything to use
Bundle 'tpope/vim-sensible'
" Automatically closes delimiters like quotes, braces, and parenthesis
Bundle 'Raimondi/delimitMate'
" Automatically opens omni completetion menu
"Bundle 'AutoComplPop'
" Adds coffeescript syntax and a few convenience functions for compiling,
" running, and viewing the JS output of a coffeescript file
Bundle 'kchmck/vim-coffee-script'
Bundle 'vimwiki/vimwiki'
" Use with <Leader>di to draw stuff
Bundle 'vim-scripts/DrawIt'
" Also uses ctags to show a list of tags, not sure how it's different from tagbar
Bundle 'vim-scripts/taglist.vim'
" Automatically does a syntax check on various filetypes when saving
Bundle 'scrooloose/syntastic'
" A nice filesystem browser, use <F4> to open
Bundle 'scrooloose/nerdtree'
" General functions for other plugins by 'xolox'
Bundle 'xolox/vim-misc'
" Gives Python reference for a given identifier using either <F1> or :PyRef
Bundle 'xolox/vim-pyref'
" Open .pdf file with :Pdf
Bundle 'vim-scripts/open-pdf.vim'
" Fuzzy searching for files, buffers, and tags, use with :CtrlP
Bundle 'kien/ctrlp.vim'
" C-Call-Tree...view the help to see how to use
Bundle 'vim-scripts/CCTree'
" Adds 'surround' commands such as vS, cs, ds, and ys
Bundle 'tpope/vim-surround'
" A git wrapper for vim
Bundle 'tpope/vim-fugitive'
Bundle 'boras/gdbvim'
" Opens a window showing vim's undo tree, use with <F3>
Bundle 'mbbill/undotree'
" Includes a C language reference. <Leader>cr searches selected word/text, <Leader>cw prompts for what to search, <Leader>cc opens the reference
Bundle 'vim-scripts/CRefVim'
" OpenSession and SaveSession with \s[s] (session save) \so (session open)
Bundle 'xolox/vim-session'
" Syntax file for EBNF
Bundle 'killphi/vim-ebnf'
" gives 'ai', 'ii', 'iI', and 'aI' text objects for indent blocks
Bundle 'michaeljsmith/vim-indent-object'
" Use <F9> to show the yankring for previous yanks/deletes
Bundle 'vim-scripts/YankRing.vim'
" Switch to alternate file (.h, for .c) with :A or :AT (<Leader>alt), file under cursor with
" <Leader>ih or <Leader>is
Bundle 'vim-scripts/a.vim'
" Makes the 'f' and 't' mappings work better (multiline)
Bundle 'chrisbra/improvedft'
" Do calculations, use <Leader>cl for a line, or <Leader>ca to do a
" calculation and put it in the default register
Bundle 'arecarn/crunch'
Bundle 'bling/vim-airline'
" HTML5 syntax and omnicomplet
Bundle 'othree/html5.vim'
Bundle 'othree/html5-syntax.vim'
" Auto closes a tag after the first '>' but not in comments
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'Valloric/YouCompleteMe'
" comment stuff with 'gcc' or 'gc{motion}'
Bundle 'tomtom/tcomment_vim'
" Needed for tcomment_vim
Bundle 'tomtom/tlib_vim'
" Small utilities, hides "press Enter..." and caches some stuff?
Bundle 'MarcWeber/vim-addon-mw-utils'
" For pasting snippets for code/text, use "gsm" to activate
Bundle 'garbas/vim-snipmate'
" A set of common snippets for snipmate
Bundle 'honza/vim-snippets'
" Provides Tern for vim. Tern provides code analysis for javascript (might
" need to bind some keys to leverage this)
Bundle 'marijnh/tern_for_vim'
" Provides ":Gist" commands to post buffers to Github's gist
Bundle 'mattn/gist-vim'
" Needed for gist-vim (library for webapi functions)
Bundle 'mattn/webapi-vim'
" Send text to screen. Put in the screen session ('main') and window
" name/number and then use "[{visual}]ctrl-c ctrl-c" to send text
Bundle 'jpalardy/vim-slime'
" Shows and outline of the current file based on different arguments to the
" initial 'Voom' call (ex. ':Voom vimwiki')
Bundle 'vim-voom/VOoM'
" Shows the diff between a 'recovered' file and what's on disk
Bundle 'chrisbra/Recover.vim'

" Some Bundle's I'm considering but have not added:
" Bundle 'SirVer/ultisnips'
" Bundle 'vimoutliner/vimoutliner'
" Doesn't work right now...but it should allow me to have a shell inside vim
" Bundle 'vim-scripts/Conque-Shell'
" Doesn't work right now...send text to running IPython instance
" Bundle 'ivanov/vim-ipython'

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
let g:yankring_history_dir = '~/.vim'
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_update_on_write = 2
let g:gist_open_browser_after_post = 1
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1

set undodir='/home/thomas/.vim/undo/'
set undofile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

augroup vimrc
	" Delete all autocommands in this group (so we don't set them twice...)
	autocmd!
	" Call appropriate functions for each filetype to do multiple things
	autocmd BufNewFile,BufRead *.html,*.css,*.js call s:WebAutoCommands()
	autocmd BufNewFile,BufRead *.wiki call s:VimwikiAutocommands()
	autocmd BufNewFile,BufRead *.java call s:JavaAutocommands()
	autocmd BufNewFile,BufRead *.coffee call s:CoffeeScriptAutocommands()
	autocmd BufNewFile,BufRead *.py call s:PythonAutocommands()
	autocmd BufNewFile,BufRead *.c,*.h call s:CAutocommands()
	autocmd BufNewFile,BufRead *.cm call s:CMinusMinusAutocommands()
augroup END

function s:WebAutoCommands()
	" Auto save html, css, and js files whenever possible (for live.js)
	" TODO: toggle this autocmd with a variable
	" if g:web_autosave
	augroup web_autosave
		autocmd!
		autocmd CursorMoved,CursorHold *.html,*.css,*.js if expand('%') != '' | update | endif
	augroup END
	let g:airline#extensions#whitespace#checks = ['trailing']
endfunction

function s:VimwikiAutocommands()
	nnoremap j gj
	nnoremap k gk
	setlocal linebreak
	highlight Folded ctermbg=234
	let g:airline#extensions#whitespace#checks = ['trailing']
endfunction

function s:PythonAutocommands()
	set noexpandtab
	set softtabstop=0
	set tabstop=5
	set shiftwidth=0
endfunction

function s:JavaAutocommands()
	abbreviate print System.out.println(
endfunction

" At some point I will probably add some so this is just a place holder
function s:CoffeeScriptAutocommands()
	"Bundle 'AutoComplPop'
	function Build()
		write
		silent !cake build
		silent redraw!
	endfunction
	let coffee_cake_options='build'
	let coffee_make_options='build'
	compiler cake
	"autocmd CursorHold *.coffee call Build()
	noremap <F5> :call Build()<CR>
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

" Runs make, redraws the screen, opens and goes to the error window
noremap <Leader>m :silent make!\|redraw!\|cw 4\|wincmd j<CR>
" Appends some text to any number of lines
noremap <Leader>a :normal A
noremap <Leader>t :tabnew<space>
noremap <Leader>sc :set spell<CR>
noremap <Leader>sn :set nospell<CR>
noremap <Leader>v :tabnew ~/.vimrc
noremap <Leader>alt :AT<CR>
noremap <Leader>ca :Crunch<CR>
inoremap jk <Esc>

" --------------------- Run things through filters or as commands ---------------------
" Filters some range through a command
noremap <Leader>e :!
" Filters the file through a command (like 'dos2unix')
noremap <Leader>ef :%!
" Runs the line through bash
noremap <Leader>o :.w !bash<CR>
" Filters current line as a bash command and replaces it with the output (`date`)
noremap <Leader>sh :.!bash<CR>
noremap <Leader>rc :r !
noremap <Leader>rls :r !ls<space>
noremap <Leader>rda :r !date<CR>
noremap <Leader>rpw :r !pwd<CR>

" --------------------- Session Commands ---------------------
noremap <Leader>s :SaveSession<space>
noremap <Leader>ss :SaveSession<space>
noremap <Leader>so :OpenSession<space>

" --------------------- Open various views in other windows ---------------------
noremap <F2> :TagbarToggle<CR>
noremap <F3> :UndotreeToggle<CR>
noremap <F4> :NERDTreeToggle<CR>
noremap <F9> :YRShow<CR>

" --------------------- Regex Mappings ---------------------
" Sets up a regex
noremap <Leader>r :s///gc<Left><Left><Left><Left>
" Sets up a global, file wide regex
noremap <Leader>re :%s///gc<Left><Left><Left><Left>
" Grabs the word under the cursor and sets up a regex to replace it
noremap <Leader>rv :%s/<c-r><c-w>//gc<left><left><left>
" Removes any whitespace after each line
noremap <Leader>rw :%s/\s*$//g
" Can be used to remove whitespace after only certain lines
noremap <Leader>rwe :s/\s*$//g

" --------------------- Save a file with Ctrl + S ---------------------
nnoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>gv
inoremap <C-s> <Esc>:w<CR>a

" --------------------- Move between tabs ---------------------
noremap <M-Right> gt
noremap <M-Left> gT
noremap <C-k> gt
noremap <C-j> gT

" --------------------- Activate and traverse snipMate suggestions ---------------------
" I can add 'm' after 'gs' to fix it...
imap gsm <Plug>snipMateNextOrTrigger
smap gsm <Plug>snipMateNextOrTrigger
imap <c-j> <Plug>snipMateNextOrTrigger
smap <c-j> <Plug>snipMateNextOrTrigger
imap <c-k> <Plug>snipMateBack
smap <c-k> <Plug>snipMateBack
imap gsh <Plug>snipMateShow
