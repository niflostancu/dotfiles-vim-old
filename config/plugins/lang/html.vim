" Plugins for HTML
let plug = vimconf#plugin#register("lang/html")

" HTML5 syntax and omnicomplete
let plug.html5 = {'from': "othree/html5.vim", "on_ft": "html"}
function! plug.html5.hook_add() dict
	let g:html5_event_handler_attributes_complete = 0
	let g:html5_rdfa_attributes_complete = 0
	let g:html5_microdata_attributes_complete = 0
	let g:html5_aria_attributes_complete = 0
endfunction

" HTML addons
let plug.jinja = {'from': "mitsuhiko/vim-jinja", "on_ft": ["htmljinja", "jinja"]}
let plug.mustache = {'from': "mustache/vim-mustache-handlebars", "on_ft": ["html"]}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

