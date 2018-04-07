" Session plugins
let plug = g:user_plugins

" Per-project (local) configuration files
let plug.obsession = {'from': "tpope/vim-obsession.git"}

function plug.obsession.hook_add() dict
	augroup User_session
		autocmd!
		autocmd VimEnter * nested call s:load_session()
		autocmd User Obsession call s:save_session_extended()
	augroup END
endfunction

" Function to save extended session variables:
"  - tab titles (for airline#tabline);
function s:save_session_extended()
	let l:body = readfile(g:this_obsession)

	for i in range(1, tabpagenr("$"))
		let l:title = gettabvar(i, 'title')
		if !empty(l:title)
			call insert(l:body, 'call settabvar(' .string(i). ', ''title'', "'.
						\ escape(l:title, '\\"') . '")', -3)
		endif
		" Preserve NERDTree open state
		let l:NERDBufName = gettabvar(i, 'NERDTreeBufName')
		if l:NERDBufName && bufwinnr(l:NERDBufName) != -1
			" call insert(l:body, "", -3) TODO
		endif
	endfor
	call writefile(body, g:this_obsession)

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

