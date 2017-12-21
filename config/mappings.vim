" Override / define vim mappings

" Leaders
let g:mapleader = '<space>'
let g:maplocalleader = '\'

" Mappings for denite / fuzzy searchers
nnoremap [denite] <Nop>
nmap ; [denite]

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

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
