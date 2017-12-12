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
  let hooks = ["hook_add", "hook_source", "hook_post_source"]
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

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
