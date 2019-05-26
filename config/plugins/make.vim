" Generic make plugins
let plug = vimconf#plugin#register("make")

" Neomake (disabled)
let plug.neomake = {'from': "neomake/neomake", "on_cmd": "Neomake", "if": 0}
function plug.neomake.hook_source() dict
	call neomake#configure#automake({
		\  "BufWritePost": {"delay": 0}
		\ })

	let g:neomake_echo_current_error = 0
	let g:neomake_open_list = 0
	let g:neomake_verbose = 0

endfunction

" Asynchronous Lint Engine
let plug.ale = {'from': "w0rp/ale"}
function plug.ale.hook_add() dict
	let g:ale_sign_error = '✖'
	let g:ale_sign_warning = '⚠'
	let g:ale_sign_info = 'ℹ'

endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

