" Configures the theme

" Enable 256 color terminal
set t_Co=256

" Enable true color
if has('termguicolors')
	set termguicolors
endif

execute 'colorscheme one'
set background=dark

let g:airline_theme='one'

