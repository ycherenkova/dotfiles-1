set nocompatible

set t_Co=256
" Required for Powerline to work in windows
set encoding=utf-8
if has('gui_running')
  set lines=60
  set columns=100
  set guifont=Consolas_for_Powerline_fixedD:h10
  colorscheme xoria256
  " No Toolbar in GUI
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
else
  "Some highlight colors for basic 8 color terminals.
  "Highlights the status line so we know what split were on
  "hi StatusLine ctermfg=15 ctermbg=1 cterm=bold
  "Changes the colors for completion menus
  "hi Pmenu ctermbg=grey ctermfg=black
  hi PmenuSel ctermbg=red
  hi clear SignColumn
  "Set color of the line numbers to dark grey.
  "hi LineNr ctermfg=darkgrey
  "Highlight matching parenthesis
  "highlight MatchParen ctermbg=4
  hi Search cterm=NONE ctermfg=white ctermbg=darkblue
endif

filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

set rtp+=~/powerline/bindings/vim
"set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/

Bundle "duff/vim-scratch"
Bundle "PeterRincker/vim-argumentative"
Bundle 'Raimondi/delimitMate'
"Bundle 'bling/vim-airline'
Bundle 'mhinz/vim-signify'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'airblade/vim-gitgutter'
Bundle 'gmarik/vundle'
"Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'vim-scripts/SearchComplete'
Bundle 'vim-scripts/TeTrIs.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/closetag.vim'
Bundle 'vim-scripts/mru.vim'

let g:signify_vcs_list = ['git']
highlight DiffAdd     cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete  cterm=bold ctermbg=none ctermfg=167
highlight DiffChange  cterm=bold ctermbg=none ctermfg=227

let g:EclimCompletionMethod='omnifunc'
set completeopt-=preview

"let g:signify_disable_by_default = 1

let delimitMate_expand_cr = 1

let delimitMate_excluded_regions_enabled = 0

"let g:airline_powerline_fonts = 1
"let ttimeoutlen = 50
"let g:Powerline_symbols='fancy'
"let g:ctrlp_custom_ignore = {
  "\ 'dir': '\v[\/]review$'
  "\ }
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let NERDTreeShowBookmarks=1

set nobackup
set noswapfile
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

set backspace=indent,eol,start

set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set whichwrap+=<,>,[,]
set laststatus=2
set ruler
set showmode
set undolevels=1000
set pumheight=10
set equalalways
set scrolloff=4

set autoindent
set cindent

set novisualbell
set noerrorbells

let mapleader=","
let maplocalleader=","

" Disable entering EX Mode.
nnoremap Q <nop>

" Yank and paste with incremented number
nnoremap <leader>p p<C-A>==yy

" Yank to clipboard
vnoremap <leader>y "+y

" Expands it to the current file path.
nmap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"nmap <Leader>i :e sftp://chittle3@myweb.cs.uwindsor.ca/public_html/

set pastetoggle=<F2>
"nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F3> :SignifyToggle<CR>
" Comment/uncomment lines of code. The 'gv' make the text stay selected
vnoremap <silent> <F4> :call NERDComment('x', 'Toggle')<CR>gv
nnoremap <silent> <F4> :call NERDComment('n', 'Toggle')<CR>
" Used to switch between Header file and source files
nnoremap <silent> <F5> :A<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>

" Ctrl-c Clears the current search query to stop the highlighting
nmap <silent> <C-c> :let @/=""<CR>

" Quick save with leader-w
nmap <Leader>w :w<CR>

" Global replace of word under cursor
nmap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Window Min Height
set wmh=0
nnoremap <M-s> gt
nnoremap <M-h> gT
nnoremap <Esc>s gt
nnoremap <Esc>h gT
"nnoremap <M-Up> <C-W>k<C-W>_
"nnoremap <M-Down> <C-W>j<C-W>_
"nnoremap <M-Left> <c-w>h<c-w><Bar>
"nnoremap <M-Right> <c-w>l<c-w><Bar>
"nnoremap <M-n> <C-W>k<C-W>_
"nnoremap <M-t> <C-W>j<C-W>_
"nnoremap <M-h> <c-w>h<c-w><Bar>
"nnoremap <M-s> <c-w>l<c-w><Bar>
"nnoremap <Esc>n <C-W>k<C-W>_
"nnoremap <Esc>t <C-W>j<C-W>_
"nnoremap <Esc>h <c-w>h<c-w><Bar>
"nnoremap <Esc>s <c-w>l<c-w><Bar>

" Leader navigation of windows
nmap <silent> <Leader>h :wincmd h<CR>
nmap <silent> <Leader>t :wincmd j<CR>
nmap <silent> <Leader>n :wincmd k<CR>
nmap <silent> <Leader>s :wincmd l<CR>

" Leader Shift Motion moves windows around
nmap <silent> <Leader>H :wincmd H<CR>
nmap <silent> <Leader>T :wincmd J<CR>
nmap <silent> <Leader>N :wincmd K<CR>
nmap <silent> <Leader>S :wincmd L<CR>

nmap <silent> <Leader>dv :e ~/Dropbox/dotfiles/vimrc<CR>
nmap <silent> <Leader>v :e $MYVIMRC<CR>

" Dvorak remap
noremap h h
noremap t gj
noremap n gk
noremap s l

" Next and previous search result
noremap l n
noremap L N
" Mappings for other keys overwritten by hjkl
" Jump till
noremap j t
" Kill char then insert
noremap k s
" Kill line then insert
noremap K S
" Move to bottom of page
noremap N L

" Easy access to beginning and end of line
noremap - $
noremap _ ^

"imap jj <Esc>

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" copy to buffer
vmap <C-y> :w! ~/.vimbuffer<CR>
nmap <C-y> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

" Delete Trailing White Space
:command! DTWS :%s/\s\+$//g
" Reverts the file to the state it was in when it was last saved
" LastSavePoint
:command! LSP :e!

:command! SudoSave :w !sudo tee %

" Highligts lines that are too long as an error.
function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    call matchadd('ErrorMsg', '\%>' . &textwidth . 'v.\+', -1)
  endif
endfunction

au FileType text,cpp setlocal textwidth=80
au FileType java setlocal textwidth=100

au BufEnter,BufWinEnter * call HighlightTooLongLines()

" Highlight trailing whitespace
au VimEnter,ColorScheme * highlight ExtraWhitespace guibg=red ctermbg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Map caps lock to escape
function! SetCapsLockToEscape()
  call system("xmodmap -e 'clear lock' && xmodmap -e 'keycode 0x42 = Escape'")
endfunction

" Maps caps lock do what you would think it would do
function! ResetCapsLock()
  call system("xmodmap -e 'keycode 0x42 = Caps_Lock' && xmodmap -e 'add lock = Caps_lock'")
endfunction

"au VimEnter,InsertEnter * call SetCapsLockToEscape()
if !has('win32')
  au VimEnter * call SetCapsLockToEscape()
  au VimLeave * call ResetCapsLock()
endif

if filereadable($HOME . "/.vimrc_local")
  source $HOME/.vimrc_local
endif

syntax on
filetype plugin indent on
