" Configures the theme

" Enable 256 color terminal
set t_Co=256

" Enable true color
if has('termguicolors')
	set termguicolors
endif

function! UserIndentGuidesColor()
	hi IndentGuidesOdd  guibg=#292f39 ctermbg=235
	hi IndentGuidesEven guibg=#2c333d ctermbg=236
endfunction
autocmd UserAuto VimEnter,Colorscheme * call UserIndentGuidesColor()

set background=dark
execute 'colorscheme one'

autocmd UserAuto VimEnter execute 'colorscheme one'

