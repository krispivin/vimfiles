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
set completeopt=menu,menuone
set copyindent
set foldlevelstart=99
set foldmethod=syntax
set formatoptions+=1j
set gdefault
set guioptions-=T
set hlsearch
set incsearch
set ignorecase
set laststatus=2
set linebreak
set listchars=tab:>-,eol:$
set mousehide
set mousemodel=popup
set number
set relativenumber
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
set statusline=%<%f%y%h%m%r%=%(%l\ /\ %L%)\ 
set tabstop=8
set tags=./.tags;,.tags
"set textwidth=78
set undofile
set wildmenu

"Always show filetypes in syntax menu
let do_syntax_sel_menu = 1
" q is easier than \ as a leader
let mapleader = "q"

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
if has('win32')
	set runtimepath+=$HOME/vimfiles/bundle/vundle/
	call vundle#rc("$HOME/vimfiles/bundle")
else
	set runtimepath+=~/.vim/bundle/vundle/
	call vundle#rc()
endif

Bundle 'gmarik/vundle'
nnoremap <Leader>bi :BundleInstall<CR>

Bundle 'a.vim'
let g:alternateExtensions_h = "inl,c,m,mm,cpp,cxx,cc,CC"
let g:alternateExtensions_m = "c,cpp,h"
let g:alternateExtensions_mm = "c,cpp,h"
let g:alternateNoDefaultAlternate = 1
nnoremap <Leader>a :A<CR>

Bundle ('rhysd/clever-f.vim')
let g:clever_f_fix_key_direction = 1

Bundle 'gerw/vim-HiLinkTrace'

Bundle 'embear/vim-localvimrc'
let g:localvimrc_ask = 0

Bundle 'scrooloose/nerdcommenter'

Bundle 'scrooloose/nerdtree'

Bundle 'majutsushi/tagbar'
nnoremap <F9> :TagbarToggle<CR>
let g:tagbar_expand = 1

Bundle 'SirVer/ultisnips'
let g:snips_author = 'Kris Pivin'
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

Bundle 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = { 'text' : 1, 'markdown' : 1, 'gitcommit' : 1 }

" CtrlP
Bundle 'kien/ctrlp.vim'
let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:24,results:24'
set wildignore+=*.o,*.obj,*.bin,*.ani,*.swp,*.bak,*.pch,*.apk*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/assets/*,*/undo/*,*/Content*/*
"let g:ctrlp_custom_ignore = { 'dir': '\vassets$', 'file': '\v\.(exe|so|dll|bin)$', }
"let g:ctrlp_custom_ignore = '\v\.(swp|bak)$'
"let g:ctrlp_custom_ignore = '\v\~$|\.(o|obj|swp|bak|wav|mp3|ogg|ani|pch|apk*)$|(^|[/\\])\.(hg|git|bzr|svn)($|[/\\])'

""""""""""""""""""""""""""""""""""""""""""
"  Key Mappings
""""""""""""""""""""""""""""""""""""""""""
" Using q as leader, but macros are handy (Q is Ex-Mode, goodbye)
nnoremap Q q
" In case we time out, don't record a macro
nnoremap q <Nop>

" Some leader mappings, pretty self-explanatory
nnoremap <Leader>q :q<CR>
nnoremap <Leader>v :source $MYVIMRC<CR>

" Easily remove search highlighting with Esc
nnoremap <Esc> :nohlsearch<CR><Esc>

" Save us from hitting shift all the time
nnoremap ; :

" Arrow keys up and down by display lines instead of file lines
nnoremap <Down> gj
inoremap <Down> <Esc>gja
nnoremap <Up> gk
inoremap <Up> <Esc>gka

" Make Y yank to end of line, like C and D
nnoremap Y y$

" Use the spacebar to toggle the current fold in normal mode
" TODO:  Find something more useful to do with spacebar
nnoremap <Space> za

" Puts spaces around all operators on a line.
" Gets confused by paren-bangs.
nnoremap <F5> :s/\(\w\+]*)*\)\([*/%+\-<>!&\^<Bar>=][&<Bar><]\==\=\)\((*!*"*\-\=\w\+\)/\1<Space>\2<Space>\3/g<CR>
" Ditto for all lines in the file.
nnoremap <S-F5> :g!/"/s/\(\w\+]*)*\)\([*/%+\-<>!&\^<Bar>=][&<Bar><]\==\=\)\((*!*"*\-\=\w\+\)/\1<Space>\2<Space>\3/g<CR>

" Put spaces after semicolons where necessary
nnoremap <F6> :s/;\(\k\)/;<Space>\1/g<CR>
" Ditto for entire file
nnoremap <S-F6> :%s/;\(\k\)/;<Space>\1/g<CR>

" SVN diff on current file
nnoremap <F8> :set columns=188<CR>:VCSVimDiff<CR>
nnoremap <S-F8> :set columns=110<CR>

" Run ctags
nnoremap <F4> :!~/bin/dirtags .<CR>

" Save files in unix format
"nnoremap <F4> :w ++ff=unix<CR>

" ^] in insert mode completes tag
inoremap  
" ^L in insert mode completes line
inoremap  

" Move up and down between diffs a la Cornerstone
nnoremap <D-Up> [c
nnoremap <D-Down> ]c

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
	au FileType cpp,c,objc,objcpp,actionscript setlocal ts=4 sts=4 sw=4 expandtab
	au FileType cpp,c,objc,objcpp,actionscript let c_no_curly_error = 1
	au FileType java setlocal ts=4 sts=4 sw=4 expandtab
	" Perl Coding
	au FileType perl setlocal ts=4 cindent
	au FileType perl highlight Identifier  term=underline ctermfg=3 guifg=yellow 
	" Vim Files, K brings up :help for keyword under cursor
	au FileType vim setlocal keywordprg=:help
augroup END

syntax on

