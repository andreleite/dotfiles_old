"pathogen
execute pathogen#infect()

"matchit
runtime macros/matchit.vim

"gitgutter
let g:gitgutter_sign_column_always = 1

"invisible chars
"set list
set listchars=tab:▸·,trail:·,eol:¬

"syntastic
let g:syntastic_javascript_checkers=['standard']
let g:syntastic_less_checkers=['csslint']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='!'
let g:syntastic_warning_symbol='!'

"SETTINGS
set backspace=2

"misc
set nocompatible
set encoding=utf-8
set number
set wrap
syntax on
set ruler
set noswapfile

"tabline & statusbar
set showtabline=2
set laststatus=2

"indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding
set foldmethod=indent
set fdc=0
set foldlevel=2
set foldlevelstart=0
set nofoldenable

"layout
set linebreak

"filetypes
filetype plugin on

"markdown
let g:vim_markdown_frontmatter=1
let g:pencil#wrapModeDefault='soft'
augroup pencil
  autocmd!
  autocmd FileType text,markdown,mkd,md call pencil#init()
  autocmd FileType text,markdown,mkd,md set nolist
augroup END
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ''
endfunction
nnoremap <Leader>m :Goyo x100%<CR>

"close buffer without losing split
nnoremap <Leader>d :bp\|bd #<CR>

"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_user_command = 'find %s -type f | egrep -v "content|PERL5LIB|releases|static_content|var|Makefile.PL"'

let g:NERDTreeWinSize=45
map <C-n> :NERDTreeToggle<CR>


"nany
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set tags=$HOME/.perl_ctags
set wildmenu
nmap t :tag
nmap - <C-]>

set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set ts=4
set shiftwidth=4
set ai
set termencoding=utf-8
set mouse=n
"set foldmethod=indent
set laststatus=2
au BufRead,BufNewFile *.t set filetype=perl

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

map <F5> :!perl -wc %<CR>
map <F2> :q! <CR>
map <F12> :w <CR>
map <F9> :set number <CR>
map <F10> :set nonumber <CR>
map <F4> :TlistToggle <CR>
vmap <F7> :-1/^#/s///<CR>
vmap <F6> :-1/^/s//#/<CR>

hi Search term=bold ctermfg=0 ctermbg=3

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
 augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For C and C++ files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd FileType *      set formatoptions=tcql nocindent comments&
  autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
 augroup END

 augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files
  "	  read:	set binary mode before reading the file
  "		uncompress text in buffer after reading
  "	 write:	compress file after writing
  "	append:	uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre	*.gz set bin
  autocmd BufReadPost,FileReadPost	*.gz let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost	*.gz set nobin
  autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")

  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r

  autocmd FileAppendPre			*.gz !gunzip <afile>
  autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
  autocmd FileAppendPost		*.gz !gzip <afile>:r
 augroup END
endif
if &term=="xterm"
     set t_Co=8
     set t_Sb=^[4%dm
     set t_Sf=^[3%dm
endif

" some extra commands for HTML editing
nmap ,mh wbgueyei<<ESC>ea></<ESC>pa><ESC>bba
nmap ,h1 _i<h1><ESC>A</h1><ESC>
nmap ,h2 _i<h2><ESC>A</h2><ESC>
nmap ,h3 _i<h3><ESC>A</h3><ESC>
nmap ,h4 _i<h4><ESC>A</h4><ESC>
nmap ,h5 _i<h5><ESC>A</h5><ESC>
nmap ,h6 _i<h6><ESC>A</h6><ESC>
nmap ,hb wbi<b><ESC>ea</b><ESC>bb
nmap ,he wbi<em><ESC>ea</em><ESC>bb
nmap ,hi wbi<i><ESC>ea</i><ESC>bb
nmap ,hu wbi<u><ESC>ea</i><ESC>bb
nmap ,hs wbi<strong><ESC>ea</strong><ESC>bb
nmap ,ht wbi<tt><ESC>ea</tt><ESC>bb
nmap ,hx wbF<df>f<df>

" first add a function that returns a time stamp in the desired format
if !exists("*TimeStamp")
	fun TimeStamp()
		return "Time-stamp: <" . strftime("%d %b %Y %X") . " pleiva>"
	endfun
endif

" this function searches for an existing time stamp and updates it using the
" function declared above
if !exists("*UpdateTimeStamp")
	fun UpdateTimeStamp()
		if ((match(getline("$"),"Time-stamp: <.*>")) > 1) || ((match(getline(line("$")-1),"Time-stamp: <.*>")) > 1) || ((match(getline(line("$")-2),"Time-stamp: <.*>")) > 1)
			exe "$-2,$ s/Time-stamp: <.*>/" . TimeStamp()
		endif
	endfun
endif

" abbreviation to manually enter a timestamp. Just type YTS in insert mode
iab YTS <C-R>=TimeStamp()<CR>

" add an autocommand to update an existing time stamp when writing the file
" It uses the functions above to replace the time stamp and restores cursor
" position afterwards (this is from the FAQ)
autocmd BufWritePre,FileWritePre *.pm  ks|call UpdateTimeStamp()|'s

let s:a = 0
" first add a function that returns a unique log id
if !exists("*LogId")
	fun LogId()
		if (s:a == 0)
			let s:a = (localtime() - 1121351660) * 4
		else
			let s:a = s:a + 1
		endif
		return " " . s:a  . " "
	endfun
endif

if !exists("*ReplAllLogId")
	fun ReplAllLogId()
		exe "1,$ s/\(LOG_ID_HERE/(".LogId()
	endfun
endif

if !exists("*ReplLogError")
	fun ReplLogError()
		exe ". s/log_error\(/log_error2(".LogId().","
	endfun
endif

imap \anmb	<C-R>=LogId()<CR>
"map <F9>	:silent call ReplAllLogId()<Enter>
"map <F10>	:silent call ReplLogError()<Enter>
filetype on
let g:session_yank_file="~/.vim_yank"
map <silent> ,y :call Session_yank()<CR>
vmap <silent> ,y y:call Session_yank()<CR>
vmap <silent> ,Y Y:call Session_yank()<CR>
nmap <silent> ,p :call Session_paste("p")<CR>
nmap <silent> ,P :call Session_paste("P")<CR>

function Session_yank()
	new
    call setline(1,getregtype())
	put
	silent exec 'wq! ' . g:session_yank_file
	exec 'bdelete ' . g:session_yank_file
endfunction

function Session_paste(command)
	silent exec 'sview ' . g:session_yank_file
	let l:opt=getline(1)
	silent 2,$yank
	if (l:opt == 'v')
		call setreg('"', strpart(@",0,strlen(@")-1), l:opt) " strip trailing endline ?
	else
		call setreg('"', @", l:opt)
	endif
	exec 'bdelete ' . g:session_yank_file
	exec 'normal ' . a:command
endfunction

"nmap gx yiw/^\(sub\<Bar>function\)\s\+<C-R>"<CR>
let Tlist_Sort_Type = "name"								 
filetype plugin on
vmap <silent> ,e e:call ExtractMethod()<CR>

function! EditFileIfExists(file)
  if filereadable(a:file)
    :execute 'edit' a:file
  else
    :echom "File does not exists: " . a:file
  endif
endfunction

function! SplitVertically()
  :vsplit
endfunction
function! OpenTest()
  :call EditFileIfExists(substitute(substitute(expand('%:p'), 'apps\/lib\/perl_mvc', 't\/unit', 'g'), '\.pm', '.t', 'g'))
endfunction

let mapleader = ","
nmap <Leader>t :call OpenTest()<CR>
nmap <Leader>T :call SplitVertically()<CR><C-w>l:call OpenTest()<CR>
