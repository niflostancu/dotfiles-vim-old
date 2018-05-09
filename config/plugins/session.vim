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
						\ escape(l:title, '\"') . '")', -3)
		endif
		" Preserve NERDTree open state
		try
			let l:NERDBufName = gettabvar(i, 'NERDTreeBufName')
			if !empty(l:NERDBufName) && bufnr(l:NERDBufName) != -1
				let l:NERDTree = getbufvar(bufnr(l:NERDBufName), "NERDTree")
				if !empty(l:NERDTree)
					let l:code = [
							\ "tabnext " . string(i),
							\ "NERDTree \"" .
							\ 	escape(l:NERDTree.root.path.str(), '\"') . "\""
						\ ]
					let l:openDirs = s:NERDTree_extractOpenDirs(l:NERDTree.root)
					for p in l:openDirs
						call add(l:code, "call b:NERDTree.root.reveal(g:NERDTreePath.New(\"" .
							\ escape(p, '\"') . "\"), { \"open\": 1 })")
					endfor
					call add(l:code, "call b:NERDTree.render()")
					call extend(l:body, l:code, -3)
				endif
			endif
		catch
			echom "caught" v:exception "at" v:throwpoint
		endtry
	endfor
	call insert(l:body, "tabnext 1", -3)
	call writefile(body, g:this_obsession)
endfunction

function! s:NERDTree_extractOpenDirs(rootNode) abort
    let retVal = []

    for node in a:rootNode.children
        if has_key(node, "isOpen") && node.isOpen
            call add(retVal, node.path.str())

            let childOpenDirs = s:NERDTree_extractOpenDirs(node)
            if !empty(childOpenDirs)
                let retVal = retVal + childOpenDirs
            endif
        endif
    endfor

    return retVal
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

