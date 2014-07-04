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
  " Powerline update statusline faster.
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
"Plugin 'bling/vim-airline'
"Plugin 'ervandew/supertab'
"Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'vim-scripts/JavaImp.vim--Lee'
"Plugin 'vim-scripts/snipMate'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/MatchTagAlways'
Plugin 'duff/vim-scratch'
Plugin 'epeli/slimux'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-signify'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'sukima/xmledit'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'uguu-org/vim-matrix-screensaver'
Plugin 'vim-scripts/SearchComplete'
Plugin 'vim-scripts/javacomplete'

call vundle#end()

set rtp+=~/powerline/bindings/vim
"set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/

"ctags --recurse --langmap=Java:.java --languages=Java --verbose -f ~/.vim/tags $ANDROID_SDK/sources
set tags+=~/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

let g:signify_vcs_list = ['git']
highlight DiffAdd     cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete  cterm=bold ctermbg=none ctermfg=167
highlight DiffChange  cterm=bold ctermbg=none ctermfg=227

let g:xmledit_enable_html = 1

let g:mta_use_matchparen_group = 0
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

set completeopt-=preview

" Remove the <:> matchpairs on html files as it will mess with xmledit plugin.
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"

let delimitMate_expand_cr = 1

let delimitMate_excluded_regions_enabled = 0

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

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

set clipboard=unnamed,unnamedplus

set wildmenu
set wildmode=longest:full,full

let mapleader=","
let maplocalleader=","

noremap <silent> <buffer> <Leader>i :JavaImport<cr>
noremap <silent> <buffer> <Leader>d :JavaDocSearch -x declarations<cr>

" Disable entering EX Mode.
nnoremap Q <nop>

" Yank and paste with incremented number
nnoremap <leader>p p<C-A>==yy

" Yank to clipboard
vnoremap <leader>y "+y
vnoremap // y/<c-r>"<cr>

" Expands it to the current file path.
nmap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

set pastetoggle=<F2>

nmap <silent> <F3> :SignifyToggle<CR>

" Comment/uncomment lines of code. The 'gv' make the text stay selected
vnoremap <silent> <F4> :call NERDComment('x', 'Toggle')<CR>gv
nnoremap <silent> <F4> :call NERDComment('n', 'Toggle')<CR>

" Used to switch between Header file and source files
nnoremap <silent> <F5> :GundoToggle<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>

let g:gundo_map_move_older = "t"
let g:gundo_map_move_newer = "n"

nnoremap <silent> <Leader>c :SlimuxREPLSendLine<CR>
vnoremap <silent> <Leader>c :SlimuxREPLSendSelection<CR>

nnoremap <silent> <Leader>b :MBEFocus<CR>

" Ctrl-c Clears the current search query to stop the highlighting
nmap <silent> <C-c> :let @/=""<CR>

" Quick save with leader-w
nmap <Leader>w :w<CR>

" Global replace of word under cursor
nmap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

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

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Select text that was just pasted.
noremap gV `[v`]`

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" copy to buffer
vmap <C-y> :w! ~/.vimbuffer<CR>
nmap <C-y> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

" Delete Trailing White Space
:command! DTWS :%s/\s\+$//g

" LastSavePoint
" Reverts the file to the state it was in when it was last saved
:command! LSP :e!

:command! SudoSave :w !sudo tee %

" Highligts lines that are too long as an error.
function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    call matchadd('ErrorMsg', '\%>' . &textwidth . 'v.\+', -1)
  endif
endfunction

au FileType text,cpp,tex setlocal textwidth=80
au FileType java setlocal textwidth=100

au BufEnter,BufWinEnter * call HighlightTooLongLines()

" Highlight trailing whitespace
au VimEnter,ColorScheme * highlight ExtraWhitespace guibg=red ctermbg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

au FileType tex setlocal spell
highlight SpellBad ctermfg=Red term=Reverse guisp=Red gui=undercurl ctermbg=White

" Map caps lock to escape
function! SetCapsLockToEscape()
  call system("xmodmap -e 'clear lock' && xmodmap -e 'keycode 0x42 = Escape'")
endfunction

" Maps caps lock do what you would think it would do
function! ResetCapsLock()
  call system("xmodmap -e 'keycode 0x42 = Caps_Lock' && xmodmap -e 'add lock = Caps_lock'")
endfunction

" Now caps lock is remapped in bashrc.
"if !has('win32')
  "au VimEnter * call SetCapsLockToEscape()
  "au VimLeave * call ResetCapsLock()
"endif

if filereadable($HOME . "/.vimrc_local")
  source $HOME/.vimrc_local
endif

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

syntax on
filetype plugin indent on
