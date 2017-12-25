" Plugins for Golang
let plug = g:user_plugins

" GO Syntax / helpers
let plug.go = {'from': "fatih/vim-go", "on_ft": "go"}

function! plug.go.hook_source() dict
	let g:go_def_mapping_enabled = 0
	let g:go_snippet_engine = 'automatic'
	let g:go_highlight_extra_types = 1
	let g:go_highlight_operators = 1
endfunction

" Go deoplete daemon
let plug.go_deoplete = {'from': "zchee/deoplete-go", "on_ft": "go", "build": "make"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
