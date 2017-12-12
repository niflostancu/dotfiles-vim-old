" UI-related plugins (e.g. theme, status line etc.)
let plug = g:user_plugins

" Themes:
let plug.theme_one = {'from': "rakr/vim-one"}
let plug.theme_onedark ={'from': "joshdick/onedark.vim"} 

" Airline (custom status / tab bar)
let plug.airline = {'from': "vim-airline/vim-airline"}

" See the contents of the registers ('@' / '"')
let plug.peekaboo = {'from': "junegunn/vim-peekaboo"}

" Seamless TMux navigation
let plug.tmux_navigator = {'from': "christoomey/vim-tmux-navigator"}

" Undo tree!
let plug.undotree = {'from': "mbbill/undotree", "on_cmd": "UndotreeToggle"}

" Indent guides
let plug.indentguides = {'from': "nathanaelkane/vim-indent-guides", 
			\ "on_cmd": ["IndentGuidesEnable", "IndentGuidesDisable", "IndentGuidesToggle"]}
function! plug.indentguides.hook_add() dict
	let g:indent_guides_color_change_percent = 3
	let g:indent_guides_autocmds_enabled = 0
	let g:indent_guides_default_mapping = 0
	let g:indent_guides_guide_size = 1
	let g:indent_guides_start_level = 1
	let g:indent_guides_indent_levels = 15
	let g:indent_custom_exclude = [ 'help', 'denite', 'codi' ]
	autocmd UserAuto BufEnter *
				\ if ! empty(&l:filetype) && index(g:indent_custom_exclude, &l:filetype) == -1
				\|   if g:indent_guides_autocmds_enabled == 0 && &l:expandtab
				\|     IndentGuidesEnable
				\|   elseif g:indent_guides_autocmds_enabled == 1 && ! &l:expandtab
				\|     IndentGuidesDisable
				\|   endif
				\| endif

endfunction
function! plug.indentguides.hook_post_source() dict
	call indent_guides#init_script_vars()
	call indent_guides#highlight_colors()
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
