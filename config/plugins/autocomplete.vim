" Autocompletion plugins
let plug = g:user_plugins

" Context file type library
let plug.context_filetype = {'from': "Shougo/context_filetype.vim", "lazy": 1}

" Deoplete - asynchronous autocompletion
let plug.deoplete = {'from': "Shougo/deoplete.nvim", "depends": "context_filetype.vim",
		\ "hook_add": "let g:deoplete#enable_at_startup = 1"}

function plug.deoplete.hook_source() dict
endfunction

" Code snippets
let plug.neosnippet = {'from': "Shougo/neosnippet.vim", "depends": [
			\ "neosnippet-snippets", "context_filetype.vim"], "on_event": "InsertCharPre", "on_ft": "snippet",
			\ "hook_add": "let g:neosnippet#data_directory = $VIM_CACHE.'/snippets'"}
let plug.snippets = {'from': "Shougo/neosnippet-snippets"}

function plug.neosnippet.hook_source() dict
	let g:neosnippet#enable_snipmate_compatibility = 1
	let g:neosnippet#enable_completed_snippet = 1
	let g:neosnippet#expand_word_boundary = 1
	autocmd UserAuto InsertLeave * NeoSnippetClearMarkers
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

