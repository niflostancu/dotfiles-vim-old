" Git integration plugins
let plug = g:user_plugins

let plug.gina = {'from': "lambdalisue/gina.vim", "on_cmd": "Gina"}
function plug.gina.hook_add() dict
	" Gina key bindings
	Shortcut (git/gina) Status
		\ noremap <silent> <leader>gs :Gina status<CR>
	Shortcut (git/gina) Commit
		\ noremap <silent> <leader>gc :Gina commit<CR>
	Shortcut (git/gina) Commit (amend)
		\ noremap <silent> <leader>gC :Gina commit<CR>
	Shortcut (git/gina) Add (stage) current file
		\ noremap <silent> <leader>ga :Gina add %<CR>
	Shortcut (git/gina) Add (stage) all files
		\ noremap <silent> <leader>gA :Gina add .<CR>
	Shortcut (git/gina) Diff (global)
		\ noremap <silent> <leader>gd :Gina diff<CR>
	Shortcut (git/gina) Blame
		\ noremap <silent> <leader>gb :Gina blame<CR>
endfunction

let plug.committia = {'from': "rhysd/committia.vim", "on_path": "COMMIT_EDITMSG",
		\ "hook_source": "let g:committia_min_window_width = 70"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :


