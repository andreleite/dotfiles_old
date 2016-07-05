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

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ''
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
nnoremap <C-m> :Goyo x100%<CR>

"close buffer without losing split
"nnoremap <C-d> :bp\|bd #<CR>

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=45
