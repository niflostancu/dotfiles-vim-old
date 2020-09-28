" Plugins for Golang
let plug = vimconf#plugin#register("lang/go")

" GO Syntax / helpers
let plug.go = {'from': "fatih/vim-go", "on_ft": "go"}

function! plug.go.hook_source() dict
	let g:go_def_mapping_enabled = 0
	let g:go_snippet_engine = 'automatic'
	let g:go_highlight_extra_types = 1
	let g:go_highlight_operators = 1
endfunction

" Go language server extension for CoC
let plug.coc_go = {'from': "josa42/coc-go", 
			\ 'build': "yarn install --frozen-lockfile"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
