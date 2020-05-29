" Enable modern Vim features not compatible with Vi spec.
set nocompatible
syntax on
filetype plugin indent on

" Plugins {{{
call plug#begin('~/.vim/plugged')

" Quality of life plugins {{{
" Don't have to do anything to use, repeats plugin commands.
Plug 'tpope/vim-repeat'
" A set of nice defaults for vim; don't need to do anything to use.
Plug 'tpope/vim-sensible'
" Makes the 'f' and 't' mappings work better (multiline)
Plug 'chrisbra/improvedft'
" Automatically closes delimiters like quotes, braces, and parenthesis
" You can use <s-tab> to jump out of one level of delimiters
" and <c-g>g to jump out of all
" Plug 'Raimondi/delimitMate'
" Auto-closes pairs of strings (e.g. ()). Can also do multicharacter pairs
" unlike delimitMate.
Plug 'tmsvg/pear-tree'
" Shows the diff between a 'recovered' file and what's on disk
Plug 'chrisbra/Recover.vim'
" Automatically restore file cursor position and folding information
Plug 'vim-scripts/restore_view.vim'
" Slow down 'hjkl' commands if used too often (to encourage better behavior).
Plug 'takac/vim-hardtime'
" }}}

" Operators {{{
" Useful mapping for changing options: '{c,y}o{s,l,n,w,x}':
"   c/y -> change (y is the new one for some reason?)
"   s -> spell
"   l -> list (show whitespace)
"   n -> line numbers
"   r -> relative line numbers
"   w -> text wrap
"   x -> cursorline cursorcolumn (highlight both)
"   h -> highlight search (shows all matches highlighted)
"   i -> ignore case (for search)
"
" Also includes {[,]}{x,u,y,<space>,e,f>:
"   [,] -> encode or above, decode or below
"   x -> XML/HTML encode
"   u -> URL encode
"   y -> C string-escape encode
"   e -> Exchange current line with lines above/below
"   <space> -> Empty line above/below
"   f -> Switch files
Plug 'tpope/vim-unimpaired'
" Handle mistypings, substitutions and transformations more smartly.
" :Abolish does iabbrevs, more or less (that is, it can fix misspellings but
" with lots of varieties)
" :Subvert does :%s///, more or less (replace s with Subvert).
" cr{s,m,c,u} does coercion to {snake_case, MixedCase, camelCase, UPPER_CASE}
" Pretty much this is only here for the cr mappings.
Plug 'tpope/vim-abolish'
" Smartly increment/decrement (C-A, C-X) with different numeric/date types.
Plug 'tpope/vim-speeddating'
" Similar to vim-surround, but slightly more functionality. Has variants for
" auto-selecting the closest brackets (css, dss). Allows counts (must type the
" surrounding each time though, so "2ysiw))") on the outside for multiple
" surroundings and on the inside for multiple textobjects (e.g. "ys2w)"). Has
" text objects for surroundings (ibb for auto selected block and im for
" manually selected literal surroundings).
Plug 'machakann/vim-sandwich'
" Comment stuff with 'gcc' or 'gc{motion}'. tlib_vim is a dependency of
" tcomment_vim.
Plug 'tomtom/tlib_vim' | Plug 'atomictom/tcomment_vim'
" Make alignment easier with 'ga' command.
"   gaip -> start alignment in this paragraph
"   vipga -> visually select paragraph and start alignment
"   [0-9*] -> align around Nth occurence of char or all (*). Can be used any
"   time in EasyAlign mode.
"   <enter> -> Change justification (l, c, r)
"   <c-p> -> Go to live mode (show changes live). Press space to exit?
"   <c-[rl]> -> change right/left margin (spaces).
"   <c-x> or <c-/> -> regular expression
"   <c-f> -> filter
"   <c-ilrdua> -> other options (just play with them in live mode, <c-p>)
Plug 'junegunn/vim-easy-align'
" Allow for moving arguments inside lists/parents left/right. Also adds aa and
" ia as text objects.
Plug 'AndrewRadev/sideways.vim'
" }}}

" Text Objects {{{
" Note that some of the verb plugins above also define text objects,
" including:
"
" * vim-sandwich: vib, vim_ -- select surrounded text
" * sideways: vaa, via -- select arguments

" Makes it easy to define custom text objects. This is a prerequisite for many
" other text object plugins.
Plug 'kana/vim-textobj-user'
" Adds a text object for selecting functions with af and if. Only works with a
" few languages (C, Java, Vimscript), sadly.
Plug 'kana/vim-textobj-function'
" Adds text objects ic, ac, and aC for selecting comments, and in the latter
" case, surrounding whitespace.
Plug 'glts/vim-textobj-comment'
" Select a portion of a "word" delimited by _ or UpperCase letters (e.g.
" a portion of a snake_case or camelCase variable). Use vav or viv; the former
" handles capitalization and underscores while the latter does not.
Plug 'Julian/vim-textobj-variable-segment'
" Text object for a vertical column of *something* separated by whitespace.
Plug 'coderifous/textobj-word-column.vim'
" Add text object mappings for all sorts of punctuation pairs like "vi_" or
" "vi," for selecting things in between underscores or commas.
Plug 'kurkale6ka/vim-pairs'
" gives 'ai', 'ii', 'iI', and 'aI' text objects for indent blocks
Plug 'michaeljsmith/vim-indent-object'
" }}}

" Movement {{{
" Use with g + motion (usually). Like 'gl' for goto-line or 'gw' for goto-word.
Plug 'Lokaltog/vim-easymotion'
" Adds mappings for indent-aware movement: {[,]}{-+=%_}:
"   [,] -> Above or below
"   - -> less indent
"   + -> more indent
"   = -> same indent
Plug 'jeetsukumaran/vim-indentwise'
" Gives emacs/readline-like keybindings in insert and command mode. I mostly
" want it for command-mode, though.
" Plug 'tpope/vim-rsi'
"
" Alternative to vim-rsi that I want to try if vim-rsi doesn't work. Only
" affects command mode rather than also affecting insert-mode.
"
" After trying both, this one seems to work better. I don't want emacs
" bindings outside of command mode anyway.
Plug 'ryvnf/readline.vim'
" }}}

" Theme and Visuals {{{
" Molokai is the color theme I use with vim
Plug 'tomasr/molokai'
" Nice alternative themes.
Plug 'morhetz/gruvbox'
" Makes Vim look nice
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Change the colorscheme depending on the actual sunrise/sunset for a given
" lat/long.
" Plug 'cadadr/vim-sunflower'
" Smooth scrolling
Plug 'psliwka/vim-smoothie'
" Make indentation levels when using spaces more obvious
Plug 'Yggdroot/indentLine'
" }}}

" Highlights {{{
" Highlight the word under the cursor (after a small delay) by default
Plug 'RRethy/vim-illuminate'
" Highlight css (and other?) colors as the color they are. Automatic for CSS
" and HTML (see settings below), but can be enabled via {y,c}ok (k for kolor).
Plug 'chrisbra/Colorizer'
" Use with :DoRainbowToggle (or "co)")
Plug 'kien/rainbow_parentheses.vim'
" Press - to give the current identifier a random highlight and _ to clear it
Plug 'akesling/ondemandhighlight'
" Highlights search patterns and ranges for Ex commands and shows live
" previews for :substitute :smagic and :snomagic
Plug 'markonm/traces.vim'
" Make yanks more obvious by briefly highlighting them
Plug 'machakann/vim-highlightedyank'
" Clears search highlight if cursor is moved and improves star-search. I've
" forked it to remove a mapping (gd) which messes with my ALEGoToDefinition
" mapping.
Plug 'atomictom/vim-slash'
" Use with :MRU; combines with vim-startify below.
" Plug 'yegappan/mru'
" Access through plain 'vim' in bash, provides a fancy start screen
" Plug 'mhinz/vim-startify'
" }}}

" Sign column {{{
" Shows changes with many VCS's including git, mercurial, and perforce
Plug 'mhinz/vim-signify'
" Show marks (e.g. 'mx') in the sign column. Unfortunately it conflicts with
" anything else using the sign column like vim-gitgutter.
"   mx -> toggle mark 'x'
"   dmx -> remove mark 'x' (from anywhere)
"   m, -> place next available mark
"   m. -> place next available mark or remove first exist one
"   m<space> -> remove all marks
"   [`'[]][`'[]] -> Jump to next/previous mark/start-of-line (` first means
"   alphabetical order, [ first means file-order).
"   m/ -> location list of marks.
"   m[0-9] -> Toggle a special marker (visual only); shift removes them.
"   [[]][-=] -> Jump to next/prev line with marker of same/any type.
"   m? -> location list of special markers.
"   m<BS> -> Remove all special markers.
"   :SignatureRefresh -> Redraw
Plug 'kshenoy/vim-signature'
" }}}

" Sidebars and Windows {{{
" A fork of Gundo with extra features. Use with <F2>
Plug 'simnalamburt/vim-mundo'
" Opens a window showing vim's undo tree, use with <F3>
" Plug 'mbbill/undotree'
" Uses ctags and shows various tags in a 'tagbar' window, use <F8> to activate
Plug 'majutsushi/tagbar'
" Toggle the Vista outline with <F7>
Plug 'liuchengxu/vista.vim'
" A nice filesystem browser, use <F4> to open
Plug 'scrooloose/nerdtree'
" Use :YRShow (<F9>) to show the yankring for previous yanks/deletes. Press \p
" and \P to move through previous entries after pasting something.
" Disabled because it doesn't play nice with other plugins. It remaps a ton of
" keys causing issues for plugins like repeat.vim.
" Plug 'vim-scripts/YankRing.vim'
" Use :Yanks (<F9>) to show previous yanks and/or (shift+)\p to cycle through
" previous ones when pasting.
Plug 'maxbrunsfeld/vim-yankstack'
" Shows and outline of the current file based on different arguments to the
" initial 'Voom' call (ex. ':Voom vimwiki')
Plug 'vim-voom/VOoM'
" Use <c-w>m to "zoom" in on a given split (window)
Plug 'dhruvasagar/vim-zoom'
" }}}

" Syntax and AutoComplete {{{
" Automatically does a syntax check on various filetypes when saving
" Plug 'scrooloose/syntastic'
" Same as syntastic, but async. The plan is to move entirely to Ale.
Plug 'dense-analysis/ale'
" Semantic autocompletion.
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer --clang-completer --cs-completer --go-completer --ts-completer --rust-completer --java-completer' }
" }}}

" Vim Applications {{{
Plug 'vimwiki/vimwiki'
" Use with <Leader>di to draw stuff (with arrow keys and more).
Plug 'vim-scripts/DrawIt'
" Use "g=" on a selection/movement or "g==" on a line to evaluate some
" mathematical calculation. Can use variables and works with math inside
" comments.
Plug 'arecarn/crunch'
" Easy alignment use with :Tab /{pat}/[{r,l,c}{num}]+
" Where {pat} is what to match, r, l, and c are alignment,
" and num is number of spaces. Disabled in favor of vim-easy-align.
" Plug 'godlygeek/tabular'
" A calendar plugin that supposedly works with Google Calendar / Task
" Plug 'itchyny/calendar.vim'
" A calendar plugin that supposedly works with vimwiki
" Plug 'mattn/calendar-vim'
" }}}

" VCS {{{
" Some commands to make it easier to interact with git. :Gblame for blame,
" :Gmove to git mv. Lots of other commands as well, but I don't really plan to
" learn them not. Also used by airline to disable branch info.
Plug 'tpope/vim-fugitive'
" View commits with :GV (GV! for current file only).
Plug 'junegunn/gv.vim'
" }}}

" Session management {{{
" General functions for other plugins by 'xolox'
Plug 'xolox/vim-misc'
" OpenSession and SaveSession with \s[s] (session save) \so (session open)
Plug 'xolox/vim-session'
" }}}

" Fuzzy search {{{
" In-buffer fuzzy searching. Use g/ to activate.
Plug 'ggvgc/vim-fuzzysearch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" Snippets {{{
" A set of common snippets for UltiSnip.
Plug 'honza/vim-snippets'
" Use YCM to list snips, then <c-l> to activate them and <c-j/k> to navigate
" the snippets. Disabled because it appears broken (Unknown function:
" "UltiSnips#TrackChange").
Plug 'SirVer/ultisnips'
" }}}

" Gist commands {{{
" Needed for gist-vim (library for webapi functions)
Plug 'mattn/webapi-vim'
" Provides ":Gist" commands to post buffers to Github's gist
Plug 'mattn/gist-vim'
" }}}

" Remote Execution {{{
" Allows executing another process outside vim I think?
" It's a prerequisite for vimshell.vim and ghcmod-vim
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" }}}

" Exotic file types {{{
" Open .pdf file with :Pdf
Plug 'vim-scripts/open-pdf.vim'
Plug 'jamessan/vim-gnupg'
" }}}

" Language Plugins {{{

" General plugin for auto-formatting on save or when a command is run
Plug 'Chiel92/vim-autoformat'

" Syntax and commands for go
Plug 'fatih/vim-go'

" Syntax for Rust
Plug 'rust-lang/rust.vim'

" Syntax file for EBNF
Plug 'killphi/vim-ebnf'

" Syntax file for .tmux.conf
Plug 'tmux-plugins/vim-tmux'

" Haskell {{{
" Plug 'itchyny/vim-haskell-indent'
" Automatically runs hindent on save
" Plug 'alx741/vim-hindent'
" Add some helpful haskell stuff like unicode 'covers' (\ -> lambda), syntax
" highlighting, and hlint integration
" Provides omnicomplete for haskell
Plug 'eagletmt/neco-ghc'
" Call hoogle from inside vim. Use <leader>h{h,i,c} to search, get additional
" info, or close the info box
Plug 'Twinside/vim-hoogle'
Plug 'dag/vim2hs'
" Works with ghcmod for...ummm...type checking?
Plug 'eagletmt/ghcmod-vim'
" Supposedly expanded syntax for Haskell.
" Plug 'neovimhaskell/haskell-vim'
" }}}

" Lisp {{{
" 'Sane' handling of Common Lisp
"Plug 'SaneCL'
" Indent Lisp-y code
Plug 'ds26gte/scmindent'
" Racket syntax
Plug 'wlangstroth/vim-racket'
" Syntax file for hy
Plug 'hylang/vim-hy'
" }}}

" Python {{{
" Python syntax
Plug 'hdima/python-syntax'
" Gives Python reference for a given identifier using either <F1> or :PyRef
Plug 'xolox/vim-pyref'
" Provides some Python-specific text objects and movements.
Plug 'jeetsukumaran/vim-pythonsense'
" }}}

" C/C++ {{{
" Switch to alternate file (.h, for .c) with :A or :AT (<Leader>alt), file under cursor with
" <Leader>ih or <Leader>is
" Plug 'vim-scripts/a.vim'
" Includes a C language reference. <Leader>cr searches selected word/text, <Leader>cw prompts for what to search, <Leader>cc opens the reference
Plug 'vim-scripts/CRefVim'
" C-Call-Tree...view the help to see how to use
Plug 'hari-rangarajan/CCTree'
" }}}

" JavaScript and Friends {{{
" Syntax highlighting, and the like, w/ a few options that can customize it
Plug 'pangloss/vim-javascript'
" Provides Tern for vim. Tern provides code analysis for javascript (might
" need to bind some keys to leverage this)
Plug 'marijnh/tern_for_vim'
" Syntax and highlighting for purescript
Plug 'raichoo/purescript-vim'
" Adds coffeescript syntax and a few convenience functions for compiling,
" running, and viewing the JS output of a coffeescript file
Plug 'kchmck/vim-coffee-script'
" }}}

" HTML and HTML templating languages {{{
" Automatically highlight matching tags
Plug 'Valloric/MatchTagAlways'
" Zen Coding for HTML
Plug 'mattn/emmet-vim'
" HTML5 syntax and omnicomplete
Plug 'othree/xml.vim'
Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'
" Automatically close html tags
Plug 'ypid/HTML-AutoCloseTag'
" Liquid syntax highlighting for jekyll
Plug 'tpope/vim-liquid'
Plug 'mitsuhiko/vim-jinja'
" Some commands for working with tags like HTML, XML, PHP, etc.
" All start with <C-X>
" <C-X><space> turn word into inline tag
" <C-X><CR> turn word into tag then indent
" <C-X>:
"     / -- Last tag closed
"    ! -- Doctype
"    # -- Meta content-type
"    @ -- Stylesheet
"    $ -- Script
" + Others
Plug 'tpope/vim-ragtag'
" }}}

" CSS {{{
" CSS3 highlighting
Plug 'hail2u/vim-css3-syntax'
" This plugin maybe messes with undotree
" Plug 'gorodinskiy/vim-coloresque'
" Plug 'ap/vim-css-color'
" }}}

" }}}

call plug#end()
" }}}

" Looks {{{
if has("termguicolors") && match($TERM, "screen") == -1
  set termguicolors
endif
set term=xterm-256color
set t_Co=256
set title
" Make the contrast more contrast-y if using the gruvbox theme
let g:gruvbox_contrast_dark = 'hard'
" Make the "monokai" theme match the original "molokai" one.
let g:molokai_original = 0
" Use alternative monokai colors.
let g:rehash256 = 0
colorscheme molokai
" Make matching brackets look a little less like the cursor jumped
" See https://github.com/tomasr/molokai/pull/44
highlight MatchParen ctermfg=208 ctermbg=233 cterm=bold
" Make vim-illuminate underline the word under the cursor
highlight illuminatedWord cterm=underline gui=underline
" }}}

" Vim Settings {{{
filetype plugin indent on

setl expandtab
setl softtabstop=4
setl tabstop=8
setl shiftwidth=4
setl ttyfast
setl ttymouse=xterm2
setl cryptmethod=blowfish
setl foldmethod=marker
setl virtualedit=block
setl scrolloff=3
setl wildmode=full
setl backspace=indent,eol,start
setl wildmenu
setl cursorline
setl gdefault
setl incsearch
setl autoindent
setl ruler
setl showmode
setl linebreak
setl showcmd
setl ignorecase
setl smartcase
setl laststatus=2
setl hidden
setl undofile
setl undolevels=10000
setl undoreload=10000
setl backup
setl formatoptions=cqrjtl
setl undodir=~/.vim/undo/
setl backupdir=~/.vim/backup
setl directory=~/.vim/tmp
setl viminfo='1000,n$HOME/.vim/files/info/viminfo
setl sessionoptions-=options
setl viewoptions-=options
setl pastetoggle=<F10>
" More aggressive updating for with async updates in vim8
setl updatetime=100
" Show the index of the search (i.e. X/Total).
setl shortmess-=S
" }}}

" Plugin Settings {{{
" Don't add meta-key bindings because they mess with hitting escape and then
" normal mode keys.
let g:rsi_no_meta = 1
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
let g:sneak#label = 1
" I create my own mappings.
let g:skip_default_textobj_word_column_mappings = 1
" Don't try to set a mapping for tcomment textobjects
let g:tcomment_textobject_inlinecomment = ''
let g:signify_sign_change = '~'
" Show increased indentation levels with more broken up lines.
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:hardtime_default_on = 1
" How many times I can use hjkl before being slowed down.
let g:hardtime_maxcount = 10
" Only slow down if it's the same key consecutively.
let g:hardtime_allow_different_key = 1
let g:hardtime_showmsg = 1
let g:hardtime_ignore_buffer_patterns = [ "Mundo.*", "NERD.*", "undotree.*" ]
let g:hardtime_timeout = 1000
let g:list_of_normal_keys = ["h", "j", "k", "l", "gj", "gk", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "gj", "gk", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" Don't hide closing brackets after pressing <CR>, but make it so dot-repeat
" is broken.
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_pairs = {
    \ '<!--': {'closer': ' -->'},
    \ '/\*': {'closer': '\*/'},
    \ '(': {'closer': ')'},
    \ '[': {'closer': ']'},
    \ '{': {'closer': '}'},
    \ "'": {'closer': "'"},
    \ '"""': {'closer': '"""'},
    \ '"': {'closer': '"'},
    \ '`': {'closer': '`'},
    \ '<': {'closer': '>'},
    \ }
let g:pear_tree_smart_openers = 1
" This does not appear to be as smart as I thought. It seems that typing "()"
" gets you "())" which sucks.
" let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:Illuminate_delay = 100
let g:Illuminate_ftblacklist = ['nerdtree']
let g:colorizer_auto_filetype='css,html'
let g:colorizer_skip_comments = 1
" Highlight e.g. 'red'
let g:colorizer_colornames = 1
let g:ctrlp_command = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.(git|svn|hg)$\|_site\|\.jsexe$\|node_modules$',
    \ 'file': '\v\.(o|hi|js_o|js_hi|dyn_hi|dyn_o)',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_root_markers = ['.ctrlp_root']
let g:ctrlp_max_files = 30000
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_switch_buffer = 2
let g:ctrlp_user_command = '/usr/bin/ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore review
      \ -g ""'
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1
let g:purescript_indent_if = 3
let g:purescript_indent_case = 5
let g:purescript_indent_let = 4
let g:purescript_indent_do = 3
let g:purescript_indent_where = 6
let g:htmljinja_disable_html_upgrade = 1
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:vimwiki_list = [{'path': '~/.vimwiki'}]
let g:vimwiki_conceallevel = 0
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#ale#enabled = 1
let g:yankring_history_dir = '~/.vim'
let g:yankring_min_element_length = 2
let g:yankring_replace_n_nkey = '<leader>P'
let g:yankring_replace_n_pkey = '<leader>p'
let g:yankstack_map_keys = 0
let g:yankstack_yank_keys = ['y', 'd', 'c']
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_update_on_write = 2
let g:gist_open_browser_after_post = 1
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_ignore_files = ['\v.*\.rs$']
let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['rust'],
    \ }
let g:ragtag_global_maps = 1
let g:niji_matching_filetypes = ['lisp', 'scheme', 'racket', 'clojure', 'hy', 'haskell']
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1
" ----------------------------------------
" These variables are set to their defaults, but I'm listing them here because
" at some point, I may wish to change them.
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_seed_identifiers_with_syntax = 0
" ----------------------------------------
if ! exists('g:ycm_global_ycm_extra_conf')
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
endif
let g:ycm_key_list_previous_completion = ['<Up>', '<c-k>']
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<c-j>']
let g:ycm_cache_omnifunc = 1
let g:ycm_semantic_triggers = {
    \ 'haskell': ['.', ':: ', '-> '],
    \ 'css': ['    ', 're!\s{4}', 're!^\t', 're!: (\S+ )*'],
    \}
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
let g:vista_default_executive = 'ale'
" let g:vista#renderer#enable_icon = 1
" Open a preview window when the cursor is on a line with an error.
" let g:ale_cursor_detail = 1
let g:ale_set_loclist = 1
let g:ale_sign_error = "✗"
let g:ycm_error_symbol = "✗"
let g:ale_sign_warning = "⚠"
let g:ycm_warning_symbol = "⚠"
let g:ale_sign_style_error = "😡"
let g:ale_sign_style_warning = "😠"
let g:ale_linters = {
    \ 'rust': [
    \     'rls',
    \ ],
    \ 'sh': [
    \     'shellcheck',
    \ ],
    \}
let g:ale_fixers = {
    \ 'python': [
    \     'yapf',
    \     'isort',
    \ ],
    \ 'rust': [
    \     'rustfmt',
    \     'remove_trailing_lines',
    \     'trim_whitespace',
    \ ],
    \ 'sh': [
    \     'shfmt',
    \ ],
    \}
let g:ale_rust_rls_executable = '/home/thomas/.cargo/bin/rls'
let g:ale_fix_on_save = 1
" Doesn't appear to work with nightly
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_emit_files = 1
let g:is_pythonsense_suppress_object_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1
let g:is_pythonsense_alternate_motion_keymaps = 1

" Remap vim-sandwich to use surround-like mappings (i.e. ys, cs, ds).
runtime macros/sandwich/keymap/surround.vim
" }}}

" Functions {{{

" A function to customize YankRing
function! YRRunAfterMaps()
    nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function s:DoRainbowParenthesis()
    RainbowParenthesesLoadRound
    RainbowParenthesesLoadSquare
    RainbowParenthesesToggleAll
endfunction

function s:ReloadFiles()
    let l:prev = &autoread
    set autoread
    checktime
    let &autoread = l:prev
endfunction

function s:ReloadBuffer()
    let l:prev = &autoread
    set autoread
    execute "checktime " . bufnr('%')
    let &autoread = l:prev
endfunction

function s:ToggleColorColumn()
    if &colorcolumn
        let &colorcolumn=""
    else
        let &colorcolumn="80,".join(range(120,999),",")
    endif
endfunction

function s:GatherTests()
    " Record cursor position
    let cursor_info = RecordCursor()

    " Search for 'CMUnitTest tests'
    keepjumps execute "normal /CMUnitTest tests\<cr>"
    " Delete everything inside the CMUnitTest array
    keepjumps normal $di}k
    " Process/generate the test functions to put into the CMUnitTest array
    keepjumps read !./gen_tests.sh %
    " Indent all generated test functions twice
    keepjumps normal Vi}2>

    " Restore cursor position
    call FixCursor(cursor_info)
endfunction

function s:TrimTrailingWhitespace()
    " Record cursor position
    let cursor_info = RecordCursor()

    keepjumps %s/\s*$//g

    " Restore cursor position
    call FixCursor(cursor_info)
endfunction

function RecordCursor()
    return {
\     'lstart': line("w0"),
\     'pos': getpos("."),
\ }
endfunction

function FixCursor(cursor_info)
    let lstart = a:cursor_info['lstart']
    let pos = a:cursor_info['pos']

    keepjumps execute "normal " . lstart . "G"
    if lstart != 1
        execute "normal " . Min(lstart - 1, 3) . "\<c-e>"
    endif
    keepjumps call setpos('.', pos)
endfunction

function Min(a, b)
    return a:a < a:b ? a:a : a:b
endfunction

function Max(a, b)
    return a:a > a:b ? a:a : a:b
endfunction
" }}}

" Commands {{{
command -bang Q q<bang>
command -bang W w<bang>
command -bang Qa qa<bang>
command -bang QA qa<bang>
command -bang Wa wa<bang>
command -bang WA wa<bang>
command -bang E e<bang>
command NoAutosave let g:web_autosave = 0
command Autosave let g:web_autosave = 1
command DoRainbowToggle call s:DoRainbowParenthesis()
command ReloadFiles call s:ReloadFiles()
command ToggleColorColumn call s:ToggleColorColumn()
command GatherTests call s:GatherTests()
command TrimTrailingWhitespace call s:TrimTrailingWhitespace()
command -nargs=1 CopyRegister execute "let @" . <q-args> . "=@\""
command Fork execute ":tabnew %"
" }}}

" Autocommands {{{
augroup vimrc
    " Delete all autocommands in this group (so we don't set them twice...)
    autocmd!
    " Call appropriate functions for each filetype to do multiple things
    autocmd BufNewFile,BufRead *.html,*.css,*.js call s:WebAutoCommands()
    autocmd BufNewFile,BufRead *.hy call s:HyAutocommands()
    autocmd FileType bash,sh call s:BashAutoCommands()
    autocmd FileType bzl call s:BazelAutoCommands()
    autocmd Filetype c call s:CAutoCommands()
    autocmd FileType coffee call s:CoffeeScriptAutocommands()
    autocmd FileType cpp call s:CppAutoCommands()
    autocmd FileType css,scss call s:CssAutoCommands()
    autocmd FileType go call s:GoAutocommands()
    autocmd FileType haskell call s:HaskellAutocommands()
    autocmd FileType htmldjango call s:HtmlDjangoAutoCommands()
    autocmd FileType java call s:JavaAutocommands()
    autocmd FileType js,javascript call s:JsAutoCommands()
    autocmd FileType liquid setf liquid.html
    autocmd FileType markdown call s:MarkdownAutoCommands()
    autocmd FileType prolog call s:PrologAutocommands()
    autocmd FileType python call s:PythonAutocommands()
    autocmd FileType racket call s:RacketAutocommands()
    autocmd FileType rust call s:RustAutoCommands()
    autocmd FileType scheme call s:SchemeAutocommands()
    " autocmd FileType htmljinja setf htmljinja.html
    autocmd FileType svg,html,htmljinja,liquid call s:HtmlAutoCommands()
    autocmd FileType vim call s:VimAutoCommands()
    autocmd FileType vimwiki call s:VimwikiAutocommands()
    autocmd FileType yaml call s:YamlAutoCommands()
augroup END

function s:BashAutoCommands()
    setl expandtab
    setl tabstop=8
    setl shiftwidth=4
    setl softtabstop=-1 " Make it the same as shiftwidth
    let g:ale_fix_on_save = 1
endfunction

function s:BazelAutoCommands()
    setl expandtab
    setl tabstop=8
    setl shiftwidth=2 " 2 not 4 because Python double indents for some reason
    setl softtabstop=-1 " Make it the same as shiftwidth
    setl indentexpr=ftpython#GetIndent(v:lnum)
    " setl indentexpr=clib#GetIndent()
endfunction

function s:CAutoCommands()
    setl noexpandtab
    setl tabstop=4
    setl shiftwidth=4
    Gcc
endfunction

function s:CoffeeScriptAutocommands()
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

function s:CppAutoCommands()
    setl expandtab
    setl softtabstop=2
    setl tabstop=8
    setl shiftwidth=2
    setl cc=80
endfunction

function s:CssAutoCommands()
    setl expandtab
    setl tabstop=8
    setl shiftwidth=4
    setl softtabstop=-1 " Make it the same as shiftwidth
endfunction

function s:GoAutocommands()
    setl noexpandtab
    setl tabstop=2
    setl shiftwidth=2
endfunction

function s:HaskellAutocommands()
    setl expandtab
    setl softtabstop=2
    setl tabstop=8
    setl shiftwidth=2
    " augroup haskell_redraw
    "     autocmd!
    "     autocmd CursorMoved,CursorHold * redraw
    " augroup END
    highlight clear Conceal
    setl nofoldenable
    noremap gt :GhcModType<CR>
    noremap gT :GhcModTypeClear<CR>
    " setl omnifunc=necoghc#omnifunc
    let g:necoghc_enable_detailed_browse = 1
    GhcRun
    DoRainbowToggle
endfunction

function s:HtmlAutoCommands()
    setl expandtab
    setl tabstop=8
    setl shiftwidth=2
    setl softtabstop=-1 " Make it the same as shiftwidth
endfunction

function s:HtmlDjangoAutoCommands()
    setl cc=80
endfunction

function s:HyAutocommands()
    HyRun
endfunction

function s:JavaAutocommands()
    abbreviate print System.out.println(
    JavaRun
    let g:syntastic_mode_map = {
    \    'mode': 'active',
    \    'active_filetypes': ['java'],
    \}
endfunction

function s:JsAutoCommands()
    setl expandtab
    setl tabstop=8
    setl shiftwidth=4
    setl softtabstop=-1 " Make it the same as shiftwidth
endfunction

function s:MarkdownAutoCommands()
    setl ft=markdown
    setl linebreak
    setl textwidth=80
endfunction

function s:PrologAutocommands()
    NoWait
    PrologRun
endfunction

function s:PythonAutocommands()
    setl expandtab
    setl softtabstop=4
    setl tabstop=8
    setl shiftwidth=4
    setl cc=80
    " Stop identation when typing a colon.
    setl indentkeys-=<:>
    " let g:syntastic_python_pylint_post_args='-d invalid-name,broad-except,logging-format-interpolation'
    " let g:syntastic_python_checkers = ['flake8']
    xmap <buffer> ak <Plug>(PythonsenseOuterClassTextObject)
    omap <buffer> ak <Plug>(PythonsenseOuterClassTextObject)
    xmap <buffer> ik <Plug>(PythonsenseInnerClassTextObject)
    omap <buffer> ik <Plug>(PythonsenseInnerClassTextObject)
    xmap <buffer> af <Plug>(PythonsenseOuterFunctionTextObject)
    omap <buffer> af <Plug>(PythonsenseOuterFunctionTextObject)
    xmap <buffer> if <Plug>(PythonsenseInnerFunctionTextObject)
    omap <buffer> if <Plug>(PythonsenseInnerFunctionTextObject)
    xmap <buffer> ad <Plug>(PythonsenseOuterDocStringTextObject)
    omap <buffer> ad <Plug>(PythonsenseOuterDocStringTextObject)
    xmap <buffer> id <Plug>(PythonsenseInnerDocStringTextObject)
    omap <buffer> id <Plug>(PythonsenseInnerDocStringTextObject)

    PyRun
endfunction

function s:RacketAutocommands()
        let b:delimitMate_quotes = "\" ` *"
    NoWait
    RacketRun
endfunction

function s:RustAutoCommands()
    setl cc=100
    let b:syntastic_check_on_open = 0
    let b:syntastic_check_on_wq = 0

    " Use ALE error navigation
    " noremap ]n :ALENextWrap<CR>
    " noremap ]N :ALEPreviousWrap<CR>
endfunction

function s:SchemeAutocommands()
        let b:delimitMate_quotes = "\" ` *"
endfunction

function s:VimAutoCommands()
    setl expandtab
    setl tabstop=8
    setl shiftwidth=4
    setl softtabstop=-1 " Make it the same as shiftwidth
    colorscheme gruvbox
endfunction

function s:VimwikiAutocommands()
    nnoremap j gj
    nnoremap k gk
    setl breakindent
    setl breakindentopt=shift:6
    setl colorcolumn=999
    setl expandtab
    setl linebreak
    setl shiftwidth=4
    setl softtabstop=4
    setl tabstop=8
    highlight Folded ctermbg=234
    " Don't overwrite the conceallevel
    let g:indentLine_setConceal = 0
endfunction

let g:web_autosave = 1
function s:WebAutoCommands()
    " Auto save html, css, and js files whenever possible (for live.js)
    " TODO: toggle this autocmd with a variable
    " if g:web_autosave
    " augroup web_autosave
    "     autocmd!
    "     autocmd CursorMoved,CursorHold *.html,*.css,*.js if expand('%') != '' && g:web_autosave == 1 | update | endif
    " augroup END
endfunction

function s:YamlAutoCommands()
    setl expandtab
    setl tabstop=8
    setl shiftwidth=2
    setl softtabstop=-1 " Make it the same as shiftwidth
endfunction
" }}}

" Custom Build {{{
" Default values
let g:custom_make_build_command = ""
let g:custom_make_build_args = ""
let g:custom_make_run_command = "\"./%<\""
let g:custom_make_run_args = ""
let g:custom_build_wait = 1
let g:custom_build_run_header = '!echo "--------------- Running ---------------"; echo; '
function g:CustomBuild()
    " ------------------------------------------------------------
    "  Emulate 'optional' arguments, where the g:* variables are the
    "  default arguments

    " Set local variables to their defaults first
    let l:build = g:custom_make_build_command
    let l:build_args = g:custom_make_build_args
    let l:run_command = g:custom_make_run_command
    let l:run_args = g:custom_make_run_args
    let l:run_header = g:custom_build_run_header
    let l:build_wait = g:custom_build_wait

    " Use buffer local settings if they exist
    if exists('b:custom_make_build_command')
        let l:build = b:custom_make_build_command
    endif
    if exists('b:custom_make_build_args')
        let l:build_args = b:custom_make_build_args
    endif
    if exists('b:custom_make_run_command')
        let l:run_command = b:custom_make_run_command
    endif
    if exists('b:custom_make_run_args')
        let l:run_args = b:custom_make_run_args
    endif
    if exists('b:custom_build_run_header')
        let l:run_header = b:custom_build_run_header
    endif
    if exists('b:custom_build_wait')
        let l:build_wait = b:custom_build_wait
    endif

    let l:before_run = ''
    if l:build_wait == 0
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
    execute l:before_run . l:run_header . l:run_command . " " . l:run_args
    redraw!
endfunction

command -nargs=* Interpret
    \ let b:custom_make_build_command = "" |
    \ let b:custom_make_build_args = "" |
    \ let b:custom_make_run_command = "\"%:p\"" . " " . <q-args>
command -nargs=* JavaRun
    \ let b:custom_make_build_command = "javac \"%:p\"" |
    \ let b:custom_make_build_args = "" |
    \ let b:custom_make_run_command = "java -cp \"%:h\" \"%:r\"" . " " .  <q-args>
command -nargs=* PyRun
    \ let b:custom_make_build_command = "" |
    \ let b:custom_make_build_args = "" |
    \ let b:custom_make_run_command = "python \"%:p\"" . " " . <q-args>
command -nargs=* PrologRun
    \ let b:custom_make_build_command = "" |
    \ let b:custom_make_build_args = "" |
    \ let b:custom_make_run_command = "prolog -s \"%:p\"" . " " . <q-args>
command -nargs=* HyRun
    \ let b:custom_make_build_command = "" |
    \ let b:custom_make_build_args = "" |
    \ let b:custom_make_run_command = "hy \"%:p\"" . " " . <q-args>
command -nargs=* RacketRun
    \ let b:custom_make_build_command = "" |
    \ let b:custom_make_build_args = "" |
    \ let b:custom_make_run_command = "racket -t \"%:p\"" . " -i " . <q-args>
command -nargs=* RunWith
    \ let b:custom_make_run_command = <q-args>
command -nargs=* GhcRun
    \ let b:custom_make_build_command = "ghc" |
    \ let b:custom_make_build_args = " -o \"%<\" \"%\"" . " " . <q-args>
command -nargs=* BuildArgs
    \ let b:custom_make_build_args = g:custom_make_build_args . " " . <q-args>
command -nargs=* Gcc
    \ let b:custom_make_build_command = "gcc" |
    \ let b:custom_make_build_args = " -o \"%<\" \"%\"" . " " . <q-args>
command -nargs=* Make
    \ let b:custom_make_build_command = "make" |
    \ let b:custom_make_build_args = <q-args>
command -nargs=* Args
    \ let b:custom_make_run_args = <q-args>
command -nargs=* NoArgs
    \ let b:custom_make_run_args = ""
command MakeWithSource
    \ let b:custom_make_build_command = "make" |
    \ let b:custom_make_build_args = "SOURCES=\"%\""
command -nargs=1 -complete=dir SaveToDirectory
    \ execute "noremap <F5> :silent! w! " . <q-args> . "/%:t<CR>"
command -nargs=0 CustomBuild
    \ noremap <F5> :call g:CustomBuild()<CR>
command NoRun
    \ let b:custom_make_run_command = "" |
    \ let b:custom_make_run_args = ""
command DoRun let b:custom_make_run_command = "\"./%<\""
command DoRunOnMakeSuccess let b:custom_make_run_command = "make && \"./%<\""
command NoTime let b:custom_make_run_command = "\"./%<\""
command Time let b:custom_make_run_command = "command time -v \"./%<\""
command NoWait let b:custom_build_wait = 0
command Wait let b:custom_build_wait = 1
" }}}

" Mappings {{{

" Basic mappings {{{
noremap <C-c> <Esc>
inoremap <C-c> <Esc>
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk
nmap Y y$
" }}}

" Miscellanious leader mappings {{{
" Appends some text to any number of lines
noremap <Leader>a :normal A
noremap <Leader>y :YcmRestartServer<CR>
noremap <Leader>yt :Fork<CR>
" Put ='s under previous line with same length
noremap <Leader>1 yypVr=
" Put -'s under previous line with same lengtH
noremap <Leader>2 yypVr-
" The equivalents to these are specified for yankring via options for some reason...
map <leader>p <Plug>yankstack_substitute_older_paste
map <leader>P <Plug>yankstack_substitute_newer_paste
nnoremap <Leader>l :ReloadFiles<CR>
inoremap <Leader>l <C-O>:ReloadFiles<CR>
noremap <Leader>" :CopyRegister<space>
noremap <Leader>"a :CopyRegister a<CR>
noremap <Leader>"b :CopyRegister b<CR>
nnoremap <Leader>] :YcmCompleter GoTo<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
" }}}

" Toggle options mappings {{{
" vim-unimpaired-like mappings for toggling rainbow parenthesis
map co) <Esc>:DoRainbowToggle<CR>
map yo) <Esc>:DoRainbowToggle<CR>
" vim-unimpaired-like mappings for toggling indentLine
map coI <Esc>:IndentLinesToggle<CR>
map yoI <Esc>:IndentLinesToggle<CR>
" vim-unimpaired-like mappings for toggling the color column
noremap yoo :ToggleColorColumn<CR>
noremap coo :ToggleColorColumn<CR>
" vim-unimpaired-like mappings for toggling Colorizer highlighting ('k' for kolor)
noremap yok <ESC>:ColorToggle<CR>
noremap cok <ESC>:ColorToggle<CR>
" vim-unimpaired-like mappings for toggling Signify
map yod <ESC>:SignifyToggle<CR>
map cod <ESC>:SignifyToggle<CR>
" Shorthand for changing double quotes to single quotes or vice-versa
nmap coq cs"'
nmap yoq cs"'
nmap coQ cs'"
nmap yoQ cs'"
" }}}

" EasyMotion mappings {{{
map gf <Plug>(easymotion-bd-f)
map gt <Plug>(easymotion-bd-t)

map gw <Plug>(easymotion-bd-w)
map gW <Plug>(easymotion-bd-e)

map gl <Plug>(easymotion-bd-jk)
" Disabled in favor of vim-easy-align
" map ga <Plug>(easymotion-jumptoanywhere)

" This disables the normal 'gn', so I've remapped that to the forward version
" of it.
map gn <Plug>(easymotion-bd-n)
noremap gN gn

" Similar to vim-sneak, but searches both ways.
xmap zs <Plug>(easymotion-s2)
xmap zs <Plug>(easymotion-s2)
map zs <Plug>(easymotion-s2)

map g} /^$<CR><c-o><Plug>(easymotion-bd-n)
map g] /^$<CR><c-o><Plug>(easymotion-bd-n)
map g[ /^$<CR><c-o><Plug>(easymotion-bd-n)
map g{ /^$<CR><c-o><Plug>(easymotion-bd-n)
" }}}

" Build mappings {{{
" Runs make, redraws the screen, opens and goes to the error window
noremap <Leader>m :silent make!\|redraw!\|cw 4\|wincmd j<CR>
noremap <Leader>nw :NoWait<CR>
noremap <Leader>yw :Wait<CR>
noremap <leader>er :Errors<CR>
noremap <leader>hh :Hoogle<space>
noremap <leader>hi :HoogleInfo<space>
noremap <leader>hc :HoogleClose<CR>
" }}}

" Location list mappings {{{
noremap ]g <esc>:lnext<CR>
noremap [g <esc>:lprevious<CR>
" }}}

" External Filter mappings {{{
" Filters current line as a bash command and replaces it with the output (`date`)
noremap <Leader>e :.!bash<CR>
noremap <Leader>b :.!bash<CR>
noremap <Leader>bash :.!bash<CR>
noremap <Leader>seq :r !seq<space>
noremap <Leader>date :r !date --iso-8601<CR>
noremap <Leader>pwd :r !pwd<CR>
" }}}

" Session mappings {{{
noremap <Leader>s :SaveSession<space>
noremap <Leader>ss :SaveSession<space>
noremap <Leader>so :OpenSession<space>
" }}}

" View Window mappings {{{
"       <F1> Help
noremap <F2> :MundoToggle<CR>
noremap <F3> :UndotreeToggle<CR>
noremap <F4> :NERDTreeToggle<CR>
noremap <F5> :call g:CustomBuild()<CR>
inoremap <F5> <C-O>:call g:CustomBuild({})<CR>
noremap <F6> :w " . <q-args> . "/%:t<CR>
noremap <F7> :Vista!!<CR>
noremap <F8> :TagbarToggle<CR>
" noremap <F9> :YRShow<CR>
noremap <F9> :Yanks<CR>
" noremap <leader>cal :Calendar<CR>
" }}}

" Regex mappings {{{
" Auto 'very magic' mode
" Disabled because it's actually a bit annoying.
" nnoremap / /\v
" vnoremap / /\v
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
nnoremap <C-s> <Esc>:TrimTrailingWhitespace<CR><Esc>:w<CR>
vnoremap <C-s> <Esc>:TrimTrailingWhitespace<CR><Esc>:w<CR>gv
inoremap <C-s> <Esc>:TrimTrailingWhitespace<CR><Esc>:w<CR>a
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

" Easy align mappings {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Sideways mappings {{{
" nnoremap <C-H> :SidewaysLeft<CR>
" nnoremap <C-L> :SidewaysRight<CR>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI
" }}}

" Sandwich mappings {{{
" This adds a text object which automatically selects the closest enclosing
" bracket/quote like surrounding.
xmap ib <Plug>(textobj-sandwich-auto-i)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap ib <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
" This adds a text object which selects an enclosing based on a literal
" character (like '_'). May not be totally necessary, but I'll keep it for now
" in case.
xmap im <Plug>(textobj-sandwich-literal-query-i)
xmap am <Plug>(textobj-sandwich-literal-query-a)
omap im <Plug>(textobj-sandwich-literal-query-i)
omap am <Plug>(textobj-sandwich-literal-query-a)
" This adds a text object which allows selecting some arbitrary block
" surrounded by some char or bracket-type. Disabled because I'm not really
" sure it's useful compared to just using ib or im mappings above.
" xmap ibb <Plug>(textobj-sandwich-query-i)
" xmap abb <Plug>(textobj-sandwich-query-a)
" omap ibb <Plug>(textobj-sandwich-query-i)
" omap abb <Plug>(textobj-sandwich-query-a)
" }}}

" Word column mappings {{{
" Use 'l' for "line" instead of 'c' which interferes with "comment".
xnoremap <silent> al :<C-u>call TextObjWordBasedColumn("aw")<cr>
xnoremap <silent> aL :<C-u>call TextObjWordBasedColumn("aW")<cr>
xnoremap <silent> il :<C-u>call TextObjWordBasedColumn("iw")<cr>
xnoremap <silent> iL :<C-u>call TextObjWordBasedColumn("iW")<cr>
onoremap <silent> al :call TextObjWordBasedColumn("aw")<cr>
onoremap <silent> aL :call TextObjWordBasedColumn("aW")<cr>
onoremap <silent> il :call TextObjWordBasedColumn("iw")<cr>
onoremap <silent> iL :call TextObjWordBasedColumn("iW")<cr>
" }}}

" Signify mappings {{{
nmap ]d <plug>(signify-next-hunk)
nmap [d <plug>(signify-prev-hunk)
nmap ]D 9999]d
nmap [D 9999[d
omap id <plug>(signify-motion-inner-pending)
xmap id <plug>(signify-motion-inner-visual)
omap ad <plug>(signify-motion-outer-pending)
xmap ad <plug>(signify-motion-outer-visual)
" }}}

function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir))
endfunction

if PlugLoaded('coc.nvim')

" CoC mappings {{{
    function! s:is_previous_char_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-j> and <c-k> for trigger navigation. It only "activates" with the
    " completion menu is active, otherwise it defaults to whatever else <c-j> and
    " <c-k> are supposed to do.
    imap <silent><expr> <c-j>
          \ pumvisible() ? "\<c-n>" :
          \ <SID>is_previous_char_space() ? "\<c-j>" :
          \ coc#refresh()
    imap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    augroup cocgroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

    xmap <leader>action <Plug>(coc-codeaction-selected)
    nmap <leader>action <Plug>(coc-codeaction-selected)
    nmap <leader>action <Plug>(coc-codeaction)
    nmap <leader>fix <Plug>(coc-fix-current)
    nnoremap <leader>gq :call CocAction('format')<cr>
    xmap <leader>gq <Plug>(coc-format-selected)
    nmap <leader>gq <Plug>(coc-format-selected)
    nnoremap <leader>format :call CocAction('format')<cr>
    xmap <leader>format <Plug>(coc-format-selected)
    nmap <leader>format <Plug>(coc-format-selected)
    nnoremap <leader>fold :call CocAction('fold')<cr>
    nnoremap <leader>imports :call CocAction('runCommand', 'editor.action.organizeImport')<cr>

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" }}}

else

    set statusline+=%{NearestMethodOrFunction()}
" YCM mappings {{{
    nnoremap go :YcmCompleter GoTo<cr>
    nnoremap gd :YcmCompleter GoToDefinition<cr>
    nnoremap gz :YcmCompleter GoToDeclaration<cr>
    nnoremap gy :YcmCompleter GoToType<cr>
    nnoremap gi :YcmCompleter GoToImplementation<cr>
    nnoremap gr :YcmCompleter GoToReferences<cr>
    nnoremap gh :YcmCompleter GetDoc<cr>

    nnoremap K :YcmCompleter GetDoc<cr>
    nnoremap L :YcmCompleter GetType<cr>

    nmap <leader>rn :YcmCompleter RefactorRename<space><c-r><c-w>

    nnoremap <Leader>fix :<C-u>YcmCompleter FixIt<cr>
    nnoremap <Leader>format :YcmCompleter Format<cr>
    nnoremap <Leader>imports :<C-u>YcmCompleter OrganizeImports<cr>
" }}}

endif

" ALE mappings {{{
nnoremap gh :ALEHover<CR>
nnoremap gs :ALESymbolSearch<space><c-r><c-w><CR>
nnoremap ]g :ALENextWrap<CR>
nnoremap [g :ALEPreviousWrap<CR>
nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>
" }}}

" Fuzzy search mappings {{{
nnoremap g/ :FuzzySearch<cr>
vnoremap g/ :FuzzySearch<cr>
" }}}

" FZF mappings {{{
nnoremap <leader>snip :Snippets<CR>
nnoremap <leader>mark :Marks<CR>
nnoremap <c-h> :History:<CR>
nnoremap <leader>h: :History:<CR>
nnoremap <c-_> :History/<CR>
nnoremap <leader>h/ :History/<CR>
nnoremap <leader>h_ :History<CR>
nnoremap <c-t> :Files<CR>
nnoremap <c-g> :GFiles<CR>
nnoremap <c-p> :Lines<CR>
" Actually "c-/", but vim/terminals are weird.
nnoremap <c-_> :Rg<CR>
" }}}

" Pasting Mappings {{{
" Supposedly this will automatically switch into paste mode when pasting from
" the terminal into vim; it may not work with screen.
function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
endfunction

noremap <special> <expr> <Esc>[200~ XTermPasteBegin("i")
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
vnoremap <special> <expr> <Esc>[200~ XTermPasteBegin("c")
" }}}

" Command Mode Mappings {{{
" TODO: Either use something like this or a plugin like vim-rsi
" cnoremap <C-Q> <C-F>
" cnoremap <C-A> <Home>
" cnoremap <C-B> <Left>
" cnoremap <C-D> <Del>
" cnoremap <C-E> <End>
" cnoremap <C-F> <Right>
" cnoremap <C-N> <Down>
" cnoremap <C-P> <Up>
" cnoremap <Esc><C-B> <S-Left>
" cnoremap <Esc><C-F> <S-Right>
" }}}

" }}}

" Helps reduce weird flashing issues
set vb t_vb=
