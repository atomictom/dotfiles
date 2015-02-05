set nocompatible
syntax on

" Vundle {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle allows me to install new addons in vim
Plugin 'gmarik/Vundle.vim'
" }}}

" Plugins {{{
Plugin 'jamessan/vim-gnupg'
Plugin 'mitsuhiko/vim-jinja'
" Mostly useful for 'co{}' things for 'change option'
" But a few encoding things and ]\[ + <space>
Plugin 'tpope/vim-unimpaired'
" Use with alt + motion (like alt+j)
Plugin 'Lokaltog/vim-easymotion'
" Use with :Open{Interpreter} (e.g. :OpenPython)
" <Leader>e to send lines or visual selection & <c-j/k> to navigate
Plugin 'khorser/vim-repl'
" Don't have to do anything to use, repeats plugin commands
Plugin 'tpope/vim-repeat'
" Syntax highlighting, and the like, w/ a few options that can customize it
Plugin 'pangloss/vim-javascript'
" Use with :MRU
Plugin 'yegappan/mru'
" Indent Lisp-y code
Plugin 'ds26gte/scmindent'
" Racket syntax
Plugin 'wlangstroth/vim-racket'
" Access through plain 'vim' in bash, provides a fancy start screen
Plugin 'mhinz/vim-startify'
" Multiple cursors by highlighting in visual mode and pressing <c-n>
" <c-n> goes forward, <c-p> back, and <c-x> skips
Plugin 'terryma/vim-multiple-cursors'
" Use with :GundoToggle or <F3>
Plugin 'sjl/gundo.vim'
" Automatically close html tags
Plugin 'ypid/HTML-AutoCloseTag'
" Monokai is the color theme I use with vim
Plugin 'lsdr/monokai'
" Python syntax
Plugin 'hdima/python-syntax'
" Uses ctags and shows various tags in a 'tagbar' window, use <F8> to activate
Plugin 'majutsushi/tagbar'
" A set of nice defaults for vim, don't need to do anything to use
Plugin 'tpope/vim-sensible'
" Smartly increment/decrement (C-A, C-X) with different types
Plugin 'tpope/vim-speeddating'
" Handle text a little more smartly
" All of them use {a,b,c}word{x,y,z} syntax for options
" :Abolish does iabbrevs, more or less
" :Subvert does :%s///, more or less (replace s with Subvert, essentially)
" cr{s,m,c,u} does coercion to {snake_case, MixedCase, camelCase, UPPER_CASE}
Plugin 'tpope/vim-abolish'
" Automatically closes delimiters like quotes, braces, and parenthesis
" You can use <s-tab> to jump out of one level of delimiters
" and <c-g>g to jump out of all
Plugin 'Raimondi/delimitMate'
" Alternative rainbow parenthesis
" Use with :DoRainbowToggle
Plugin 'kien/rainbow_parentheses.vim'
" Automatically runs for specified filetypes (see :help)
Plugin 'amdt/vim-niji'
" Automatically opens omni completetion menu
"Plugin 'AutoComplPop'
" Adds coffeescript syntax and a few convenience functions for compiling,
" running, and viewing the JS output of a coffeescript file
Plugin 'kchmck/vim-coffee-script'
Plugin 'vimwiki/vimwiki'
" Use with <Leader>di to draw stuff
Plugin 'vim-scripts/DrawIt'
" Also uses ctags to show a list of tags, not sure how it's different from tagbar
" Plugin 'vim-scripts/taglist.vim'
" Automatically does a syntax check on various filetypes when saving
Plugin 'scrooloose/syntastic'
" A nice filesystem browser, use <F4> to open
Plugin 'scrooloose/nerdtree'
" General functions for other plugins by 'xolox'
Plugin 'xolox/vim-misc'
" Gives Python reference for a given identifier using either <F1> or :PyRef
Plugin 'xolox/vim-pyref'
" Open .pdf file with :Pdf
Plugin 'vim-scripts/open-pdf.vim'
" Fuzzy searching for files, buffers, and tags, use with :CtrlP
" Plugin 'kien/ctrlp.vim'
" C-Call-Tree...view the help to see how to use
Plugin 'hari-rangarajan/CCTree'
" Adds 'surround' commands such as vS, cs, ds, and ys
Plugin 'tpope/vim-surround'
" A git wrapper for vim
Plugin 'tpope/vim-fugitive'
" Opens a window showing vim's undo tree, use with <F4>
Plugin 'mbbill/undotree'
" Includes a C language reference. <Leader>cr searches selected word/text, <Leader>cw prompts for what to search, <Leader>cc opens the reference
Plugin 'vim-scripts/CRefVim'
" OpenSession and SaveSession with \s[s] (session save) \so (session open)
Plugin 'xolox/vim-session'
" Syntax file for EBNF
Plugin 'killphi/vim-ebnf'
" gives 'ai', 'ii', 'iI', and 'aI' text objects for indent blocks
Plugin 'michaeljsmith/vim-indent-object'
" Use <F9> to show the yankring for previous yanks/deletes
" Plugin 'vim-scripts/YankRing.vim'
" Use :Yanks or (shift+)Meta+p
Plugin 'maxbrunsfeld/vim-yankstack'
" Switch to alternate file (.h, for .c) with :A or :AT (<Leader>alt), file under cursor with
" <Leader>ih or <Leader>is
Plugin 'vim-scripts/a.vim'
" Makes the 'f' and 't' mappings work better (multiline)
Plugin 'chrisbra/improvedft'
" Do calculations, use <Leader>cl for a line, or <Leader>ca to do a
" calculation and put it in the default register
Plugin 'arecarn/crunch'
Plugin 'bling/vim-airline'
" HTML5 syntax and omnicomplete
Plugin 'othree/xml.vim'
Plugin 'othree/html5.vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'Valloric/YouCompleteMe'
" comment stuff with 'gcc' or 'gc{motion}'
Plugin 'tomtom/tcomment_vim'
" Needed for tcomment_vim
Plugin 'tomtom/tlib_vim'
" Small utilities, hides 'press Enter...' and caches some stuff?
" Plugin 'MarcWeber/vim-addon-mw-utils'
" For pasting snippets for code/text, use "gsm" to activate
" Plugin 'garbas/vim-snipmate'
" A set of common snippets for snipmate
Plugin 'honza/vim-snippets'
" Provides Tern for vim. Tern provides code analysis for javascript (might
" need to bind some keys to leverage this)
Plugin 'marijnh/tern_for_vim'
" Provides ":Gist" commands to post buffers to Github's gist
Plugin 'mattn/gist-vim'
" Needed for gist-vim (library for webapi functions)
Plugin 'mattn/webapi-vim'
" Just use with (visual)<c-c><c-c>, the first time it'll ask for config stuff
Plugin 'jpalardy/vim-slime'
" Shows and outline of the current file based on different arguments to the
" initial 'Voom' call (ex. ':Voom vimwiki')
Plugin 'vim-voom/VOoM'
" Shows the diff between a 'recovered' file and what's on disk
Plugin 'chrisbra/Recover.vim'
" Shows git diff status
Plugin 'airblade/vim-gitgutter'
" Show relative positioning in search (like: match 10/55)
Plugin 'IndexedSearch'
" Syntax file for hy
Plugin 'hylang/vim-hy'
" Slime for vim
" Doesn't work very well right now, at least for racket
Plugin 'kovisoft/slimv'
" 'Sane' handling of Common Lisp
Plugin 'SaneCL'
" Zen Coding for HTML
Plugin 'mattn/emmet-vim'
" Works with ghcmod for...ummm...type checking?
Plugin 'eagletmt/ghcmod-vim'
" Allows executing another process outside vim I think?
" It's a prerequisite for vimshell.vim and ghcmod-vim
Plugin 'Shougo/vimproc.vim'
" A shell in vimscript to be run inside vim
" Can be run with :VimShell{Options}
Plugin 'Shougo/vimshell.vim'
" Add some helpful haskell stuff like unicode 'covers' (\ -> lambda), syntax
" highlighting, and hlint integration
Plugin 'dag/vim2hs'
" Easy alignment use with :Tab /{pat}/[{r,l,c}{num}]+
" Where {pat} is what to match, r, l, and c are alignment,
" and num is number of spaces
Plugin 'godlygeek/tabular'
" Automatically restore file cursor position and folding information
Plugin 'restore_view.vim'
" Some commands for working with tags like HTML, XML, PHP, etc.
" All start with <C-X>
" <C-X><space> turn word into inline tag
" <C-X><CR> turn word into tag then indent
" <C-X>:
" 	/ -- Last tag closed
"	! -- Doctype
"	# -- Meta content-type
"	@ -- Stylesheet
"	$ -- Script
" + Others
Plugin 'tpope/vim-ragtag'
" Automatically highlight matching tags
Plugin 'Valloric/MatchTagAlways'
" Use YCM to list snips, then <c-l> to activate them and
" <c-j/k> to navigate the snippets
Plugin 'SirVer/ultisnips'
" Doesn't work yet, needs to be enabled with either a variable or with
" :NeoCompleteEnable
Plugin 'Shougo/neocomplete.vim'

call vundle#end()
" }}}

" Looks {{{
set term=xterm-256color
set t_Co=256
set title
colorscheme molokai
" }}}

" Vim Settings {{{
filetype plugin indent on

set ttyfast
set ttymouse=xterm2
set cryptmethod=blowfish
set foldmethod=marker
set virtualedit=block
set scrolloff=3
set wildmode=full
set backspace=indent,eol,start
set wildmenu
set cursorline
set gdefault
set incsearch
set autoindent
set ruler
set showmode
set showcmd
set ignorecase
set smartcase
set undofile
set backup
set undodir=~/.vim/undo/
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set viminfo='1000,n$HOME/.vim/files/info/viminfo
" }}}

" Plugin Settings {{{
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:vimwiki_list = [{'path': '~/.vimwiki'}]
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_min_num_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:yankring_history_dir = '~/.vim'
let g:yankring_min_element_length = 2
let g:yankring_replace_n_nkey = ','
let g:yankring_replace_n_pkey = '.'
let g:yankstack_map_keys = 0
let g:yankstack_yank_keys = ['y', 'd', 'c']
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_update_on_write = 2
let g:gist_open_browser_after_post = 1
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:ragtag_global_maps = 1
let g:niji_matching_filetypes = ['lisp', 'scheme', 'racket', 'clojure', 'hy', 'haskell']
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsListSnippets = "<Leader>snip"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:ycm_key_list_previous_completion = ['<Up>', '<c-k>']
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<c-j>']
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_enable_special = 0
let g:startify_files_number = 10
let g:startify_relative_path = 1
let g:startify_custom_header =
	\ map(split(system('cat ~/.vim/startify_header.txt'), '\n'), '"   ". v:val') + ['','']
let g:startify_skiplist = [
	\ 'COMMIT_EDITMSG',
	\ $VIMRUNTIME .'/doc',
	\ 'bundle/.*/doc',
	\ '\.DS_Store'
	\ ]
let g:startify_list_order = [
	\ ['    MRU in this directory:'],
	\ 'dir',
	\ ['    Bookmarks:'],
	\ 'bookmarks',
	\ ['    Sessions:'],
	\ 'sessions',
	\ ['    MRU:'],
	\ 'files'
	\ ]
let g:startify_custom_footer = [
	\ '',
	\ '-----------------------------------------------',
	\ '',
	\ "Vim is charityware. Please read ':help uganda'."
	\ ]

" }}}

" Functions {{{

" A function to customize YankRing
function! YRRunAfterMaps()
	nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

function s:DoRainbowParenthesis()
	RainbowParenthesesLoadRound
	RainbowParenthesesLoadSquare
	RainbowParenthesesToggleAll
endfunction
" }}}

" Commands {{{
command NoAutosave let g:web_autosave = 0
command Autosave let g:web_autosave = 1
command DoRainbowToggle call s:DoRainbowParenthesis(1)
" }}}

" Autocommands {{{
augroup vimrc
	" Delete all autocommands in this group (so we don't set them twice...)
	autocmd!
	" Call appropriate functions for each filetype to do multiple things
	autocmd BufNewFile,BufRead *.html,*.css,*.js call s:WebAutoCommands()
	autocmd FileType vimwiki call s:VimwikiAutocommands()
	autocmd FileType coffee call s:CoffeeScriptAutocommands()
	autocmd BufNewFile,BufRead *.c,*.h call s:CAutocommands()
	autocmd BufNewFile,BufRead *.cm call s:CMinusMinusAutocommands()
	autocmd BufNewFile,BufRead *.hy call s:HyAutocommands()
	autocmd FileType haskell call s:HaskellAutocommands()
	autocmd FileType java call s:JavaAutocommands()
	autocmd FileType python call s:PythonAutocommands()
	autocmd FileType racket call s:RacketAutocommands()
	autocmd FileType scheme call s:SchemeAutocommands()
	autocmd FileType prolog call s:PrologAutocommands()
augroup END

let g:web_autosave = 1
function s:WebAutoCommands()
	" Auto save html, css, and js files whenever possible (for live.js)
	" TODO: toggle this autocmd with a variable
	" if g:web_autosave
	augroup web_autosave
		autocmd!
		autocmd CursorMoved,CursorHold *.html,*.css,*.js if expand('%') != '' && g:web_autosave == 1 | update | endif
	augroup END
	let g:airline#extensions#whitespace#checks = ['trailing']
endfunction

function s:VimwikiAutocommands()
	nnoremap j gj
	nnoremap k gk
	set linebreak
	set breakindent
	set breakindentopt=shift:6
	highlight Folded ctermbg=234
	let g:airline#extensions#whitespace#checks = ['trailing']
endfunction

function s:PythonAutocommands()
	set expandtab
	set softtabstop=4
	set tabstop=8
	set shiftwidth=4
	" set noexpandtab
	" set softtabstop=0
	" set tabstop=5
	" set shiftwidth=0
	PyRun
endfunction

function s:JavaAutocommands()
	abbreviate print System.out.println(
	JavaRun
endfunction

" At some point I will probably add some so this is just a place holder
function s:CoffeeScriptAutocommands()
	"Plugin 'AutoComplPop'
	function! Build()
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

function s:CAutocommands()
	let g:airline#extensions#whitespace#checks = ['trailing']
endfunction

function s:CMinusMinusAutocommands()
	" I guess these would affect non C-- buffers, but I don't feel like
	" fixing this now since it's probably a non-issue.
	let g:syntastic_disabled_filetypes=['c', 'cm']
	" I thought syntastic was throwing warnings and this wasn't working,
	" but it was YouCompleteMe...oh well
	let g:syntastic_ignore_files = ['\v.*\.cm$', '.*\.cm', '\.*.cm', '\.\*.cm', '\v.*\.c', '.*\.c', '\.*.c']
	let g:syntastic_check_on_open = 0
	let g:syntastic_check_on_wq = 0
	let g:syntastic_mode_map = {'mode': 'active',
				\ 'active_filetypes': [],
				\ 'passive_filetypes': ['cm', 'c'] }
	let g:ycm_filetype_specific_completion_to_disable = {'c': 0}
	set filetype=c
endfunction

function s:HaskellAutocommands()
	set expandtab
	set softtabstop=2
	set tabstop=8
	set shiftwidth=2
	augroup haskell_redraw
		autocmd!
		autocmd CursorMoved,CursorHold * redraw
	augroup END
	highlight clear Conceal
	set nofoldenable
	GhcRun
endfunction

function s:HyAutocommands()
	HyRun
endfunction

function s:RacketAutocommands()
        let b:delimitMate_quotes = "\" ` *"
	NoWait
	RacketRun
endfunction

function s:SchemeAutocommands()
        let b:delimitMate_quotes = "\" ` *"
endfunction

function s:PrologAutocommands()
	NoWait
	PrologRun
endfunction
" }}}

" Custom Build {{{
let g:custom_build_command = ""
let g:custom_build_args = ""
let g:custom_build_run_command = "\"./%<\""
let g:custom_build_run_args = ""
let g:custom_build_wait = 1
let g:custom_build_run_header = '!echo "--------------- Running ---------------"; echo; '
function g:CustomBuild(options)
	" ------------------------------------------------------------
	"  Emulate 'optional' arguments, where the g:* variables are the
	"  default arguments
	let l:build = get(a:options, 'build_command', g:custom_build_command)
	let l:build_args = get(a:options, 'build_args', g:custom_build_args)
	let l:run_command = get(a:options, 'run_command', g:custom_build_run_command)
	let l:run_args = get(a:options, 'run_args', g:custom_build_run_args)

	let l:before_run = ''
	if g:custom_build_wait == 0
		let l:before_run = 'silent '
	endif

	" echom " ----- Custom Build: ----- "
	" echom l:make
	" echom l:args
	" echom expand(l:run_command)
	" echom l:run_args
	" ------------------------------------------------------------
	" Save the file, clear the screen, make it with args as make's
	" arguments, say that we're running and run it with run_command
	write
	execute 'silent !clear; ' . l:build . " " . l:build_args
	execute l:before_run . g:custom_build_run_header . l:run_command . " " . l:run_args
	redraw!
endfunction

command -nargs=* Interpret
	\ let g:custom_build_command = "" |
	\ let g:custom_build_args = "" |
	\ let g:custom_build_run_command = "\"%:p\"" . " " . <q-args>
command -nargs=* JavaRun
	\ let g:custom_build_command = "javac \"%:p\"" |
	\ let g:custom_build_args = "" |
	\ let g:custom_build_run_command = "java -cp \"%:h\" \"%:r\"" . " " .  <q-args>
command -nargs=* PyRun
	\ let g:custom_build_command = "" |
	\ let g:custom_build_args = "" |
	\ let g:custom_build_run_command = "python \"%:p\"" . " " . <q-args>
command -nargs=* PrologRun
	\ let g:custom_build_command = "" |
	\ let g:custom_build_args = "" |
	\ let g:custom_build_run_command = "prolog -s \"%:p\"" . " " . <q-args>
command -nargs=* HyRun
	\ let g:custom_build_command = "" |
	\ let g:custom_build_args = "" |
	\ let g:custom_build_run_command = "hy \"%:p\"" . " " . <q-args>
command -nargs=* RacketRun
	\ let g:custom_build_command = "" |
	\ let g:custom_build_args = "" |
	\ let g:custom_build_run_command = "racket -t \"%:p\"" . " -i " . <q-args>
command -nargs=* RunWith
	\ let g:custom_build_run_command = <q-args>
command -nargs=* GhcRun
	\ let g:custom_build_command = "ghc" |
	\ let g:custom_build_args = " -o \"%<\" \"%\"" . " " . <q-args>
command -nargs=* Gcc
	\ let g:custom_build_command = "gcc" |
	\ let g:custom_build_args = " -o \"%<\" \"%\"" . " " . <q-args>
command -nargs=* Make
	\ let g:custom_build_command = "make" |
	\ let g:custom_build_args = <q-args>
command -nargs=* Args
	\ let g:custom_build_run_args = <q-args>
command -nargs=* NoArgs
	\ let g:custom_build_run_args = ""
command MakeWithSource
	\ let g:custom_build_command = "make" |
	\ let g:custom_build_args = "SOURCES=\"%\""
command -nargs=1 -complete=dir SaveToDirectory
	\ execute "noremap <F5> :silent! w! " . <q-args> . "/%:t<CR>"
command -nargs=1 -complete=dir CustomBuild
	\ noremap <F5> :call g:CustomBuild({})<CR>
command NoRun
	\ let g:custom_build_run_command = "" |
	\ let g:custom_build_run_args = ""
command DoRun let g:custom_build_run_command = "\"./%<\""
command NoTime let g:custom_build_run_command = "\"./%<\""
command Time let g:custom_build_run_command = "command time -v \"./%<\""
command NoWait let g:custom_build_wait = 0
command Wait let g:custom_build_wait = 1
" }}}

" Mappings {{{

" Miscellanious mappings {{{
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk
nnoremap Y y$
noremap <Leader>o o<Esc>
noremap <Leader>O O<Esc>
" Appends some text to any number of lines
noremap <Leader>a :normal A
noremap <Leader>mc :MultipleCursorsFind<space>
noremap <Leader>sc :set spell<CR>
noremap <Leader>sn :set nospell<CR>
noremap <Leader>ca :Crunch<CR>
noremap <Leader>y :YcmRestartServer<CR>
noremap <Leader>1 yypVr=
noremap <Leader>2 yypVr-
noremap <Leader>rp :RainbowParenthesesLoadRound<CR>:RainbowParenthesesToggle<CR>
noremap <leader>p <Plug>yankstack_substitute_older_paste
noremap <leader>P <Plug>yankstack_substitute_newer_paste
" }}}

" EasyMotion mappings {{{
" map , <Plug>(easymotion-prefix)
map ,f <Plug>(easymotion-bd-f)
map f <Plug>(easymotion-bd-f)

map ,t <Plug>(easymotion-bd-t)
map t <Plug>(easymotion-bd-t)

map ,w <Plug>(easymotion-bd-w)
map w <Plug>(easymotion-bd-w)

map ,e <Plug>(easymotion-bd-e)
map e <Plug>(easymotion-bd-e)

" map ,j <Plug>(easymotion-j)
" map j <Plug>(easymotion-j)
"
" map ,k <Plug>(easymotion-k)
" map k <Plug>(easymotion-k)

map ,l <Plug>(easymotion-bd-jk)
map l <Plug>(easymotion-bd-jk)

map ,n <Plug>(easymotion-bd-n)
map n <Plug>(easymotion-bd-n)

map ,g <Plug>(easymotion-jumptoanywhere)
map g <Plug>(easymotion-jumptoanywhere)
" }}}

" Build mappings {{{
" Runs make, redraws the screen, opens and goes to the error window
noremap <Leader>m :silent make!\|redraw!\|cw 4\|wincmd j<CR>
noremap <Leader>nw :NoWait<CR>
noremap <Leader>yw :Wait<CR>
noremap <Leader>n :lnext<CR>
noremap <Leader>N :lprevious<CR>
" }}}

" External Filter mappings {{{
" Filters current line as a bash command and replaces it with the output (`date`)
noremap <Leader>b :.!bash<CR>
noremap <Leader>rc :r !
noremap <Leader>rls :r !ls<space>
noremap <Leader>rda :r !date<CR>
noremap <Leader>rpw :r !pwd<CR>
" }}}

" Session mappings {{{
noremap <Leader>s :SaveSession<space>
noremap <Leader>ss :SaveSession<space>
noremap <Leader>so :OpenSession<space>
" }}}

" View Window mappings {{{
"       <F1> Help
noremap <F2> :GundoToggle<CR>
noremap <F3> :UndotreeToggle<CR>
noremap <F4> :NERDTreeToggle<CR>
noremap <F5> :call g:CustomBuild({})<CR>
noremap <F6> :call g:CustomBuild({'run_command': '', 'run_args': ''})<CR>
noremap <F7> :AT<CR>
noremap <F8> :TagbarToggle<CR>
noremap <F9> :Yanks<CR>
" }}}

" Regex mappings {{{
" Auto 'very magic' mode
nnoremap / /\v
vnoremap / /\v
" Sets up a regex
noremap <Leader>r :s///c<Left><Left><Left>
" Sets up a global, file wide regex
noremap <Leader>rf :%s///c<Left><Left><Left>
" Grabs the word under the cursor and sets up a regex to replace it (globally)
nnoremap <Leader>rv :%s/\<<c-r><c-w>\>//c<left><left>
" Grabs the word under the cursor and sets up a regex to replace it (ranged)
vnoremap <Leader>rv :s/\<<c-r><c-w>\>//c<left><left>
" Grabs the word under the cursor and sets up a regex to replace it within the
" range of the previous visual selection
noremap <Leader>rvv :'<,'>s/\<<c-r><c-w>\>//c<left><left>
" Removes any whitespace after each line
noremap <Leader>rw :%s/\s*$//
" Can be used to remove whitespace after only certain lines
noremap <Leader>rwe :s/\s*$//
" }}}

" Saving Files mappings {{{
" Save a file with Ctrl + S and remove trailing whitespace
nnoremap <C-s> <Esc>:%s/\s*$//g<CR><C-o>:w<CR>
vnoremap <C-s> <Esc>:%s/\s*$//g<CR><C-o>:w<CR>gv
inoremap <C-s> <Esc>:%s/\s*$//g<CR><C-o>:w<CR>a
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %
" }}}

" Tab mappings {{{
noremap <Leader>t :tabnew<space>
noremap <Leader>v :tabnew ~/.vimrc<CR>
" Move between tabs
noremap <M-Right> gt
noremap <M-Left> gT
noremap <C-k> gt
noremap <C-j> gT
" }}}

" }}}

" Helps reduce weird flashing issues
set vb t_vb=
