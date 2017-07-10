"pathogen
execute pathogen#infect()

"matchit
runtime macros/matchit.vim

"gitgutter
let g:gitgutter_sign_column_always = 1

"invisible chars
set list
set listchars=tab:▸·,trail:·,eol:¬

"syntastic
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_less_checkers=['stylelint']
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
set colorcolumn=80

"tabline & statusbar
set showtabline=2
set laststatus=2

"indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab

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

nnoremap <Leader>d :bp\|bd #<CR>

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

map <C-n> :NERDTreeToggle<CR>

set mouse=a
