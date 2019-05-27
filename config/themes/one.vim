" One / OneDark theme
"
let plug = vimconf#plugin#register("theme")

" Plugins:
let plug.theme_one = {'from': "rakr/vim-one"}
let plug.theme_onedark ={'from': "joshdick/onedark.vim"} 

function plug.theme_one.hook_add() dict
	" Enable 256 color terminal
	set t_Co=256

	" Enable true color
	if has('termguicolors')
		set termguicolors
	endif

	let g:parenmatch_highlight = 0

	function! UserIndentGuidesColor()
		hi IndentGuidesOdd  guibg=#292f39 ctermbg=235
		hi IndentGuidesEven guibg=#2c333d ctermbg=236

		hi! link ParenMatch MatchParen
	endfunction
	autocmd VimCfg VimEnter,Colorscheme * call UserIndentGuidesColor()

	set background=dark
	execute 'colorscheme one'

	autocmd VimCfg VimEnter execute 'colorscheme one'

endfunction

