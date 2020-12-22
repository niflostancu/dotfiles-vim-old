" Override / define vim mappings

" Leaders
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

set timeoutlen=400 " milliseconds

" Saving with ctrl-s
nnoremap <C-s> :<C-u>w<CR>
vnoremap <C-s> :<C-u>w<CR>
cnoremap <C-s> <C-u>w<CR>

" Load sunaki's Shortcut plugin
execute 'set runtimepath+='.fnameescape(fnamemodify(dein#util#_get_base_path().
		\ "/repos/github.com/sunaku/vim-shortcut", ":p"))

runtime plugin/shortcut.vim

if !exists(':Shortcut')
	echoerr 'The Shortcut plugin is not loaded! Skipping mappings...'
	finish
endif

" Fallback to Shortcut
Shortcut (Shortcut) show menu
  \ noremap <silent> <Leader><Leader> :Shortcuts<Return>

Shortcut (Shortcut) fallback to menu on partial entry
  \ noremap <silent> <Leader> :Shortcuts<Return>

" Mappings for fuzzy finding tools
nnoremap [find] <Nop>
nmap ; [find]

" Window mappings
nnoremap [Window] <Nop>
nmap s [Window]

Shortcut (window) split
  \ nnoremap <silent> [Window]v  :<C-u>split<CR>
Shortcut (window) split vertically
  \ nnoremap <silent> [Window]g  :<C-u>vsplit<CR>
Shortcut (window) new tab
  \ nnoremap <silent> [Window]t  :tabnew<CR>
Shortcut (window) make the current window the only one
  \ nnoremap <silent> [Window]o  :<C-u>only<CR>
Shortcut (window) close the current window
  \ nnoremap <silent> [Window]c  :close<CR>

" Last active tab switching
if !exists('g:lasttab')
  let g:lasttab = 1
endif

autocmd VimCfg TabLeave * let g:lasttab = tabpagenr()
Shortcut (tab) switch to last tab
  \ nnoremap <silent> <Leader>t  :exe "tabn " . g:lasttab<CR>

" Go to tab by number
noremap g1 1gt
noremap g2 2gt
noremap g3 3gt
noremap g4 4gt
noremap g5 5gt
noremap g6 6gt
noremap g7 7gt
noremap g8 8gt
noremap g9 9gt

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
