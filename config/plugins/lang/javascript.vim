" Plugins for JavaScript
let plug = vimconf#plugin#register("lang/javascript")

let js_ft_all = ["javascript", "jsx", "javascript.jsx", "typescript"]

" Improved JS syntax & indent
let plug.javascript = {'from': "pangloss/vim-javascript", "on_ft": js_ft_all}
function! plug.javascript.hook_source() dict
	let g:javascript_plugin_jsdoc = 1
	highlight! link jsFutureKeys PreProc
endfunction

" Javascript / typescript language server extension for CoC
let plug.coc_tsserver = {'from': "neoclide/coc-tsserver", 
			\ 'build': "yarn install --frozen-lockfile"}

" TypeScript syntax
let plug.typescript = {'from': "leafgarland/typescript-vim"}
" TypeScript React syntax
let plug.typescript_react = {'from': "peitalin/vim-jsx-typescript"}

" Pretty JSX syntax
let plug.jsxpretty = {'from': "MaxMEllon/vim-jsx-pretty", "on_ft": js_ft_all}
" JSDoc creation
let plug.jsdoc = {'from': "heavenshell/vim-jsdoc", "on_ft": js_ft_all}
" NodeJS helpers (e.g. find node module / required files)
let plug.nodejs = {'from': "moll/vim-node", "on_ft": js_ft_all}
" Node EJS Templates
let plug.ejs = {'from': 'nikvdp/ejs-syntax'}

" Polymer / Lit-HTML Syntax
let plug.polymer = {'from': "jonsmithers/vim-html-template-literals", "on_ft": js_ft_all}

" JSON / JSONC syntax
let plug.json = {'from': "elzr/vim-json", "on_ft": "json"}
let plug.jsonc = {'from': "kevinoid/vim-jsonc", "on_ft": "jsonc"}
function! plug.json.hook_add() dict
	" Disable JSON concealing
	let g:vim_json_syntax_conceal = 0
endfunction

" JSON language server extension for CoC
let plug.coc_json = {'from': "neoclide/coc-json", 
			\ 'build': "yarn install --frozen-lockfile"}

" YAML language server extension for CoC
let plug.coc_yaml = {'from': "neoclide/coc-yaml", 
			\ 'build': "yarn install --frozen-lockfile"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
