" CTags-related plugins & config
let plug = vimconf#plugin#register("tags")

" GutenTags - update the tags database while editing files
let plug.gutentags = {'from': "ludovicchabant/vim-gutentags"}
function plug.gutentags.hook_add() dict
	let g:gutentags_generate_on_missing = 1
	let g:gutentags_generate_on_new = 1
	let g:gutentags_generate_on_empty_buffer = 1
	let g:gutentags_project_root = [".tags", "Session.vim", ".git"]
	let g:gutentags_add_default_project_roots = 1
	let g:gutentags_ctags_tagfile = '.tags'
endfunction

" Also see plugins/list.vim for FZF Tags key bindings

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

