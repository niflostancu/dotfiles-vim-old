" UI-related plugins (e.g. theme, status line etc.)
let plug = vimconf#plugin#register("ui")

" Themes:
let plug.theme_one = {'from': "rakr/vim-one"}
let plug.theme_onedark ={'from': "joshdick/onedark.vim"} 

" Airline (custom status / tab bar)
let plug.airline = {'from': "vim-airline/vim-airline"}
function plug.airline.hook_add() dict
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#taboo#enabled = 1
	let g:airline#extensions#tabline#show_tabs = 1
	let g:airline#extensions#tabline#show_splits = 0
	let g:airline#extensions#tabline#show_buffers = 0
	let g:airline#extensions#tabline#tab_nr_type = 1
	let g:airline#extensions#tabline#show_close_button = 0

	let g:airline#extensions#tabline#buffers_label = 'b'
	let g:airline#extensions#tabline#tabs_label = 'T'

	let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

	let g:airline_theme="one"
endfunction

let plug.airline_themes = {'from': "vim-airline/vim-airline-themes"}

" See the contents of the registers ('@' / '"')
let plug.peekaboo = {'from': "junegunn/vim-peekaboo"}

" Seamless TMux navigation
let plug.tmux_navigator = {'from': "christoomey/vim-tmux-navigator"}
function plug.tmux_navigator.hook_add() dict
	nnoremap <silent> <C-Left> :TmuxNavigateLeft<CR>
	nnoremap <silent> <C-Down> :TmuxNavigateDown<CR>
	nnoremap <silent> <C-Up> :TmuxNavigateUp<CR>
	nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>
endfunction

" Undo tree!
let plug.undotree = {'from': "mbbill/undotree", "on_cmd": "UndotreeToggle"}
function plug.undotree.hook_add() dict
	let g:undotree_SplitWidth = 18
endfunction

" Indent guides
let plug.indentguides = {'from': "nathanaelkane/vim-indent-guides"}
function! plug.indentguides.hook_add() dict
	let g:indent_guides_color_change_percent = 3
	let g:indent_guides_default_mapping = 0
	let g:indent_guides_guide_size = 1
	let g:indent_guides_start_level = 1
	let g:indent_guides_indent_levels = 15
	let g:indent_guides_exclude_filetypes = ['help', 'denite']
	let g:indent_guides_auto_colors = 0
endfunction
let g:indent_guides_enable_on_vim_startup = 1

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
