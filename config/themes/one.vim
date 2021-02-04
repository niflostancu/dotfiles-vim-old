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

	function! UserCustomColors()
		hi IndentGuidesOdd  guibg=#292f39 ctermbg=235
		hi IndentGuidesEven guibg=#2c333d ctermbg=236

		" Background colors for active vs inactive windows
		hi ActiveWindow guibg=#282c34 ctermbg=16
		hi InactiveWindow guibg=#2c323c ctermbg=16

		hi! link ParenMatch MatchParen
	endfunction
	autocmd VimCfg VimEnter,Colorscheme * call UserCustomColors()

	let g:parenmatch_highlight = 0

	set background=dark
	execute 'colorscheme one'

	autocmd VimCfg VimEnter execute 'colorscheme one'

	" Call method on window enter
	augroup WindowManagement
		autocmd!
		autocmd WinEnter * call Handle_Win_Enter()
	augroup END


endfunction

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
	setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

