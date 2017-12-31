let s:config_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Sources a configuration file (relative to the config/ directory)
function! User_SourceCfg(file)
	execute 'source' fnameescape(s:config_dir . '/' . a:file)
endfunction

" Reads the user plugin scripts, returning the dict object to supply to dein for loading
function! User_LoadPlugins()
	let g:user_plugins = {}
	let dein_plugins = {}
	let files = globpath($VIM_CONFIG, "config/plugins/**/*.vim", 1, 1)
	for f in files
		execute 'source' f
	endfor
	let hooks = ["hook_add", "hook_source", "hook_post_source", "hook_done_update"]
	for [name, obj] in items(g:user_plugins)
		let dein_obj = copy(obj)
		for hook in hooks
			if has_key(obj, hook) && type(obj[hook]) == 2
				let dein_obj[hook] = 'call g:user_plugins.'.name.'.'.hook.'()'
			endif
		endfor
		let from = name
		if has_key(dein_obj, 'from')
			let from = remove(dein_obj, 'from')
		endif
		let dein_plugins[from] = dein_obj
	endfor
	return dein_plugins
endfunction

" Show the output of any command in a Scratch buffer
function! s:Scratch (command, ...)
	redir => lines
	let saveMore = &more
	set nomore
	execute 'silent' a:command
	redir END
	let &more = saveMore
	call feedkeys("\<cr>")
	new | setlocal buftype=nofile bufhidden=hide noswapfile
	put=lines
	if a:0 > 0
		execute 'vglobal/'.a:1.'/delete'
	endif
	if a:command == 'scriptnames'
		%substitute#^[[:space:]]*[[:digit:]]\+:[[:space:]]*##e
	endif
	silent %substitute/\%^\_s*\n\|\_s*\%$
	let height = line('$') + 3
	execute 'normal! z'.height."\<cr>"
	0
endfunction

" Map the Scratch, + scriptnames
command! -nargs=? Scriptnames call <sid>Scratch('scriptnames', <f-args>)
command! -nargs=+ Scratch call <sid>Scratch(<f-args>)

" Close all hidden buffers
command! BuffersCleanup call s:BuffersCleanup()
function! s:BuffersCleanup()
	let open_buffers = []

	for i in range(tabpagenr('$'))
		call extend(open_buffers, tabpagebuflist(i + 1))
	endfor

	for num in range(1, bufnr("$") + 1)
		if buflisted(num) && index(open_buffers, num) == -1
			exec "bdelete ".num
		endif
	endfor
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
