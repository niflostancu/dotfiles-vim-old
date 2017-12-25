" Plugins for JavaScript
let plug = g:user_plugins

let js_ft_all = ["javascript", "jsx", "javascript.jsx"]

" Improved JS syntax & indent
let plug.javascript = {'from': "pangloss/vim-javascript", "on_ft": js_ft_all}
function! plug.javascript.hook_source() dict
	let g:javascript_plugin_jsdoc = 1
	let g:javascript_plugin_flow = 1
	highlight! link jsFutureKeys PreProc
endfunction

" JS Parameter Complete
let plug.jspc = {'from': "othree/jspc.vim", "on_ft": js_ft_all}

" TernJS Deoplete Plugin
let plug.deoplete_tern = {'from': "carlitux/deoplete-ternjs", "on_ft": js_ft_all}
function plug.deoplete_tern.hook_add() dict
	let g:deoplete#sources#ternjs#types = 1
	let g:deoplete#sources#ternjs#docs = 1
	let g:deoplete#sources#ternjs#timeout = 3

	let g:deoplete#sources#ternjs#filetypes = [
				\ 'jsx',
				\ 'javascript.jsx',
				\ 'vue',
				\ 'javascript'
				\ ]

endfunction

" Pretty JSX syntax
let plug.jsxpretty = {'from': "MaxMEllon/vim-jsx-pretty", "on_ft": js_ft_all}
" JSDoc creation
let plug.jsdoc = {'from': "heavenshell/vim-jsdoc", "on_ft": js_ft_all}
" NodeJS helpers (e.g. find node module / required files)
let plug.nodejs = {'from': "moll/vim-node", "on_ft": js_ft_all}

" JSON syntax
let plug.json = {'from': "elzr/vim-json", "on_ft": "json"}
function! plug.json.hook_add() dict
	" Disable JSON concealing
	let g:vim_json_syntax_conceal = 0
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
