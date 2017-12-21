" Objects listing (i.e. denite, fzf) plugins
let plug = g:user_plugins

" Include the plugins
let plug.denite = {'from': "Shougo/denite.nvim", "on_cmd": "Denite"}
" Location/quickfix list replacement using Denite
let plug.denite_location = {'from': "chemzqm/unite-location", "on_source": "denite.nvim"}

function plug.denite.hook_done_update() dict
	call dein#remote_plugins()
endfunction

function! plug.denite.hook_add() dict
	Shortcut (Denite) resume
		\ nnoremap <silent> [denite]r :<C-u>Denite -resume -refresh<CR>
	Shortcut (Denite) find files (recursive)
		\ nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>
	Shortcut (Denite) switch buffer / most recently opened
		\ nnoremap <silent> [denite]b :<C-u>Denite buffer file_old -default-action=switch<CR>
	Shortcut (Denite) change directory
		\ nnoremap <silent> [denite]d :<C-u>Denite directory_rec -default-action=cd<CR>
	Shortcut (Denite) show registers
		\ nnoremap <silent> [denite]v :<C-u>Denite register -buffer-name=register<CR>
	Shortcut (Denite) open location list
		\ nnoremap <silent> [denite]l :<C-u>Denite location_list -buffer-name=list<CR>
	Shortcut (Denite) open quickfix
		\ nnoremap <silent> [denite]q :<C-u>Denite quickfix -buffer-name=list<CR>
	Shortcut (Denite) grep files
		\ nnoremap <silent> [denite]g :<C-u>Denite grep<CR>
	Shortcut (Denite) jump to
		\ nnoremap <silent> [denite]j :<C-u>Denite jump change file_point<CR>
	Shortcut (Denite) show outline
		\ nnoremap <silent> [denite]o :<C-u>Denite outline<CR>
	Shortcut (Denite) find help
		\ nnoremap <silent> [denite]h :<C-u>Denite help<CR>
	Shortcut (Denite) find lines in current buffer
		\ nnoremap <silent> [denite]/ :<C-u>Denite line<CR>
	Shortcut (Denite) find lines containing cursorword
		\ nnoremap <silent> [denite]* :<C-u>DeniteCursorWord line<CR>

endfunction

" Now, FZF!

let plug.fzf = {'from': "junegunn/fzf", 'merged': 0}
let plug.fzfvim = {'from': "junegunn/fzf.vim"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

