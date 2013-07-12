" an example for a vimrc file.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")

  syntax enable
  syntax on
  set background=dark
  let g:solarized_termtrans = 1
  let g:solarized_visibility = "high"
  let g:solarized_contrast = "high"
  colorscheme solarized

  set hlsearch
""  set guifont=Menlo\ Regular:h14
  set ai			" auto indent
endif
"darkblue2.vim darkbone.vim hhazure.vim ir_black.vim solarized.vim

" Use Ctrl l/h to switch between tabs
let mapleader = ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>

" Display line numbers
:set number
set textwidth=120

" Set Tab
set tabstop=8                " 设置Tab键的宽度        [等同的空格个数]  
set shiftwidth=8  
set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]  
set softtabstop=8 

" crontab compatability
set backupskip=/tmp/*,/private/tmp/*

" ctags
set tags=./tags,./ctags,./TAGS,./CTAGS,tags;~,ctags;~,TAGS;~

" Split right and split below
set splitright
set splitbelow

" Omni Completion
" :help compl-omni or :help new-omni-completion
filetype plugin on
set ofu=syntaxcomplete#Complete

" OS-spcific actions
if has('win32')
	" Windows
elseif has('mac')
	" Mac OS X
	if has('gui_running') 
		" Fullscreen Mode: this option is available for MacVim running in GUI mdoe
		" grow to maximum horizontal width on entering 
		set fuopt+=maxhorz 
		set fu
	endif
elseif has('unix')
	" Linux or UNIX
endif

" Always display the status bar
set laststatus=2

" Spell check
set spell spelllang=en_us 

" TeX Syntax Highlight
syn match texSectioningCommand '\\section\>' skipwhite     nextgroup=texSectioningTitle contains=@texSectioningGroup
syn region texSectioningTitle        start='{'  end='}' contained
syn cluster texSectioningGroup contains=texSectioningCommand
syn cluster texChapterGroup contains=@texSectioningGroup

"======================= Pathogen  =======================

" Vim Pathogen
call pathogen#infect()

"======================= Vim Plug-ins =======================

" Latex-box
:set smartindent
let g:LatexBox_viewer="open"
let g:LatexBox_latexmk_options="-pdf"
" g:LatexBox_output_type	

" Pandoc
let g:pandoc_no_folding = 1

" taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'  
let Tlist_Show_One_File = 1            
let Tlist_Exit_OnlyWindow = 1          
let Tlist_Use_Right_Window = 1         
let Tlist_GainFocus_On_ToggleOpen = 1  
nnoremap <leader>tl : Tlist<CR>

" MiniBuf 
let g:miniBufExplSplitBelow=0
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
