" Plugin collection
let s:plugins_enabled = {}
let s:registered_plugins = {}

" Returns the map object to add plugins to a category
function! vimconf#plugin#register(category)
	return s:registered_plugins
endfunction

" Sources plugin files
function! vimconf#plugin#source()
	let files = globpath(g:vimconf_dir, "plugins/**/*.vim", 1, 1)
	for f in files
		execute 'source' f
	endfor
endfunction

function! vimconf#plugin#source_theme(name)
	call vimconf#source('themes/' . a:name . '.vim')
endfunction

" Reads the user plugin scripts, returning the dict object to supply to dein for loading
function! vimconf#plugin#_get_dein_plugins()
	let dein_plugins = {}
	let hooks = ["hook_add", "hook_source", "hook_post_source", "hook_done_update"]
	for [name, obj] in items(s:registered_plugins)
		let dein_obj = copy(obj)
		for hook in hooks
			if has_key(obj, hook) && type(obj[hook]) == 2
				let dein_obj[hook] = 'call vimconf#plugin#execute_hook("'.name.'", "'.hook.'")'
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

function! vimconf#plugin#execute_hook(plugin_name, hook_name)
	call s:registered_plugins[a:plugin_name][a:hook_name]()
endfunction

" Loads the actual plugins using the `dein` plugin manager
function! vimconf#plugin#load()
	let dein_cache = $VIM_CACHE . "/dein"
	let dein_dir = dein_cache."/repos/github.com/Shougo/dein.vim"
	if ! isdirectory(expand(dein_cache))
		call mkdir(expand(dein_cache), 'p')
	endif

	" Download & install dein if not already
	if &runtimepath !~# '/dein.vim'
		if ! isdirectory(dein_dir)
			execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
		endif
		execute 'set runtimepath+='.substitute(
			\ fnamemodify(dein_dir, ':p') , '/$', '', '')
	endif

	let dein_plugins = vimconf#plugin#_get_dein_plugins()
	if dein#load_state(dein_cache)
		call dein#begin(dein_cache, [expand('<sfile>')] +
					\ split(globpath(expand(g:vimconf_dir), '**/*.vim'), '\n'))
		
		let dein#_hook_add = 'call vimconf#source("mappings.vim")' . "\n"

		call dein#add(dein_dir)
		call dein#add("sunaku/vim-shortcut", {'lazy': 1,
					\ "hook_add": "call vimconf#source(\"mappings.vim\")"})
		call dein#load_dict(dein_plugins)

		call dein#end()
		call dein#save_state()
		if dein#check_install()
			call dein#install()
		endif
	endif

	" now we can enable filetype plugins
	filetype plugin indent on
	syntax on

endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

