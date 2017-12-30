" Session plugins
let plug = g:user_plugins

" Per-project (local) configuration files
let plug.obsession = {'from': "tpope/vim-obsession.git"}

function plug.obsession.hook_add() dict
	augroup User_session
		autocmd!
		autocmd VimEnter * nested call s:load_session()
	augroup END
endfunction

function s:load_session()
	if exists('g:SessionLoad')
		return
	endif
	let l:session_file = fnamemodify("Session.vim", ":p")
	if filereadable(l:session_file)
		execute 'silent! source '. fnameescape(l:session_file)
	endif
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

