" Plugins for JavaScript
let plug = vimconf#plugin#register("lang/javascript")

let js_ft_all = ["javascript", "jsx", "javascript.jsx"]

" Improved JS syntax & indent
let plug.javascript = {'from': "pangloss/vim-javascript", "on_ft": js_ft_all}
function! plug.javascript.hook_source() dict
	let g:javascript_plugin_jsdoc = 1
	highlight! link jsFutureKeys PreProc
endfunction

" Language specific add hook
function! plug.javascript.hook_add() dict
	let g:ale_linter_aliases = {'html': ['javascript', 'html']}
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

" TypeScript
let plug.typescript = {'from': "leafgarland/typescript-vim"}
" TypeScript React
let plug.typescript_react = {'from': "peitalin/vim-jsx-typescript"}

" Pretty JSX syntax
let plug.jsxpretty = {'from': "MaxMEllon/vim-jsx-pretty", "on_ft": js_ft_all}
" JSDoc creation
let plug.jsdoc = {'from': "heavenshell/vim-jsdoc", "on_ft": js_ft_all}
" NodeJS helpers (e.g. find node module / required files)
let plug.nodejs = {'from': "moll/vim-node", "on_ft": js_ft_all}

" Polymer / Lit-HTML Syntax
let plug.polymer = {'from': "jonsmithers/vim-html-template-literals", "on_ft": js_ft_all}

" JSON syntax
let plug.json = {'from': "elzr/vim-json", "on_ft": "json"}
function! plug.json.hook_add() dict
	" Disable JSON concealing
	let g:vim_json_syntax_conceal = 0
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
