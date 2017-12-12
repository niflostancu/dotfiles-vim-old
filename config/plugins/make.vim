" Generic make plugins
let plug = g:user_plugins

let plug.neomake = {'from': "neomake/neomake", "on_cmd": "Neomake"}

function plug.neomake.hook_add() dict
	let g:lint_filetypes = [
				\  'ansible', 'python', 'php', 'ruby', 'vim', 'go', 'sh',
				\  'javascript', 'jsx', 'javascript.jsx', 'json', 'css',
				\  'markdown', 'html', 'yaml'
				\ ]
	" automatically run on save
	autocmd UserAuto BufWritePost *
				\ if index(g:lint_filetypes, &filetype) > -1 && empty(&buftype)
				\|   Neomake
				\| elseif &filetype =~ 'html'
				\|   Neomake tidy
				\| endif

endfunction

function plug.neomake.hook_source() dict
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

