set nocompatible
" Clear all autocommands
autocmd!	
behave xterm
"so $VIMRUNTIME/mswin.vim

colorscheme abjuk

"""""""""""""""""""""""""""""""""""""""""
"  Global Settings
"""""""""""""""""""""""""""""""""""""""""
set autoindent
set autoread
set autowrite
set backspace=2
set backup
set backupext=.bak
set cindent
set clipboard=unnamed
set cmdheight=1
set completeopt=menu,menuone,longest
set foldlevel=11
set foldmethod=syntax
set formatoptions+=1
set guioptions-=T
set incsearch
set ignorecase
set laststatus=2
set linebreak
set listchars=tab:>-,eol:$
set mousehide
set mousemodel=popup_setpos
set nohlsearch
set omnifunc=ClangComplete
"set printerfont=Terminal:h9
set report=0
set scrolloff=4
set selectmode=mouse
set shiftround
set shiftwidth=4
set shortmess+=r
set showbreak=-->
set showcmd
set showfulltag
set showmatch
set showmode
set sidescroll=8
set sidescrolloff=4
set smartcase
set softtabstop=4
"set statusline=%<%f%y%h%m%r[%{SSGetLockStatus()}]%=%-14(%l,%c%V%)\ %P
set statusline=%<%f%y%h%m%r%=%-14(%l,%c%V%)\ %P
set tabstop=4
" steps up the dir tree til it finds a .tags file.
set tags=./tags,tags,~/rocketman2/.tags
"set textwidth=78
set undofile
set wildmenu

"""""""""""""""""""""""""""""""""""""""""
"  OS Specific
"""""""""""""""""""""""""""""""""""""""""
if has('win32')
	set backupdir=$HOME/vimfiles/backup,.
	set directory=$HOME/vimfiles/temp//,.
	set undodir=$HOME/vimfiles/undo,.
else
	set backupdir=~/.vim/backup,.
	set directory=~/.vim/temp//,.
	set undodir=~/.vim/undo,.
endif

if has('win32')
	set guifont=Lucida_Console:h12
elseif has('mac')
	set guifont=Menlo:h14
end

filetype off

"""""""""""""""""""""""""""""""""""""""""
"  Plugins
"""""""""""""""""""""""""""""""""""""""""

" Vundle
set runtimepath+=$HOME/vimfiles/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Vim-scripts
Bundle 'a.vim'

" YouCompleteMe
"Bundle 'Valloric/YouCompleteMe'



" TagList
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1

" Source Safe plugin
"let $SSDIR="C:\\Program Files\\Microsoft Visual Studio\\VSS"
"let $SSDIR="//zeus/DSI_VSS_2005_NET/"
"let ssLocalTree="c:._Src2"
"let ssMenuPath=""
"let ssUserName="kpivin"

" Omnicomplete 
"let OmniCpp_DefaultNamespaces = ["dslib", "game"]

" Clang Complete
let g:clang_auto_select = 0
let g:clang_complete_auto = 0
let g:clang_use_library = 1
let g:clang_complete_copen = 1
let g:clang_complete_patterns = 0
let g:clang_user_options='|| exit 0'

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

""""""""""""""""""""""""""""""""""""""""""
"  Key Mappings
""""""""""""""""""""""""""""""""""""""""""

" Make Y yank to end of line, like C and D
nnoremap Y y$

" Use the spacebar to toggle the current fold in normal mode
nnoremap <Space> za

" Puts spaces around all operators on a line.
" Gets confused by paren-bangs.
nmap <F5> :s/\(\w\+]*)*\)\([*/%+\-<>!&\^<Bar>=][&<Bar><]\==\=\)\((*!*"*\-\=\w\+\)/\1<Space>\2<Space>\3/g<CR>
" Ditto for all lines in the file.
nmap <S-F5> :g!/"/s/\(\w\+]*)*\)\([*/%+\-<>!&\^<Bar>=][&<Bar><]\==\=\)\((*!*"*\-\=\w\+\)/\1<Space>\2<Space>\3/g<CR>

" Put spaces after semicolons where necessary
nmap <F6> :s/;\(\k\)/;<Space>\1/g<CR>
" Ditto for entire file
nmap <S-F6> :%s/;\(\k\)/;<Space>\1/g<CR>

" SVN diff on current file
nmap <F8> :set columns=188<CR>:VCSVimDiff<CR>
nmap <S-F8> :set columns=110<CR>

" Run ctags
nmap <F4> :!~/bin/dirtags .<CR>

" Save files in unix format
"nmap <F4> :w ++ff=unix<CR>

" ^] in insert mode completes tag
inoremap  
" ^L in insert mode completes line
inoremap  

" Move up and down between diffs a la Cornerstone
nmap <D-Up> [c
nmap <D-Down> ]c

""""""""""""""""""""""""""""""""""""""""""
"  Filetypes
""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
"
" vim -b : edit tiff files using xxd-format!
augroup Binary
    au!
    au BufReadPre  *.tif let &bin=1
    au BufReadPost *.tif if &bin | %!xxd
    au BufReadPost *.tif set ft=xxd | endif
    au BufWritePre *.tif if &bin | %!xxd -r
    au BufWritePre *.tif endif
    au BufWritePost *.tif if &bin | %!xxd
    au BufWritePost *.tif set nomod | endif
augroup END

" Hero Designer Files are XML
au BufNewFile,BufRead *.hdt,*.hdp,*.hdc set filetype=xml

""""""""""""""""""""""""""""""""""""""""""
"  Autocommands
""""""""""""""""""""""""""""""""""""""""""
augroup Coding
	au!
	" Autosave any time we lose focus or leave the buffer
	au FocusLost,BufLeave * update
	" C Coding, 1P standards
	au FileType cpp,c source ~/.vim/MFCrc.vim
	au FileType cpp,c,objc,objcpp,actionscript setlocal ts=4 sts=4 sw=4 expandtab
	au FileType java setlocal ts=4 sts=4 sw=4 expandtab
	" Perl Coding
	au FileType perl set ts=4 cindent
	au FileType perl highlight Identifier  term=underline ctermfg=3 guifg=yellow 
augroup END

syntax on

