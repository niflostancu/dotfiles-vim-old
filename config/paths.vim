" Sets paths for storing plugins / cache files

set undofile swapfile nobackup
set directory=$VIM_CACHE/swap//,$VIM_CACHE,~/tmp,/var/tmp,/tmp
set undodir=$VIM_CACHE/undo//,$VIM_CACHE,~/tmp,/var/tmp,/tmp
set backupdir=$VIM_CACHE/backup/,$VIM_CACHE,~/tmp,/var/tmp,/tmp
set viewdir=$VIM_CACHE/view/
set nospell spellfile=$VIMPATH/spell/en.utf-8.add

" History saving
if has('nvim')
	"  ShaDa/viminfo:
	"   ' - Maximum number of previously edited files marks
	"   < - Maximum number of lines saved for each register
	"   @ - Maximum number of items in the input-line history to be
	"   s - Maximum size of an item contents in KiB
	"   h - Disable the effect of 'hlsearch' when loading the shada
	set shada='300,<50,@100,s10,h,n$VIM_CACHE/viminfo
else
	set viminfo='300,<10,@50,h,n$VIM_CACHE/viminfo
endif

" Create missing dirs
if ! isdirectory(expand('$VIM_CACHE/swap'))
  call mkdir(expand('$VIM_CACHE/swap'), 'p')
endif
if ! isdirectory(expand('$VIM_CACHE/undo'))
  call mkdir(expand('$VIM_CACHE/undo'), 'p')
endif
if ! isdirectory(expand('$VIM_CACHE/backup'))
  call mkdir(expand('$VIM_CACHE/backup'))
endif

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
