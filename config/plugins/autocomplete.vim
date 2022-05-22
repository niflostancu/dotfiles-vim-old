" Autocompletion plugins
let plug = vimconf#plugin#register("autocomplete")

" Context file type library
let plug.context_filetype = {'from': "Shougo/context_filetype.vim"}

" Deoplete - asynchronous autocompletion - disabled, using CoC (from linter.vim) instead
let plug.deoplete = {'from': "Shougo/deoplete.nvim", "if": '0'}

function plug.deoplete.hook_done_update() dict
	call dein#remote_plugins()
endfunction

function plug.deoplete.hook_add() dict
	if ! dein#tap('deoplete') | return | endif

	let g:deoplete#enable_at_startup = 1
	" Deoplete settings
	call deoplete#custom#option('ignore_sources', {})

	call deoplete#custom#option('auto_complete_delay', 50)
	call deoplete#custom#option('auto_refresh_delay', 500)
	call deoplete#custom#option('enable_refresh_always', 0)
	call deoplete#custom#option('enable_camel_case', 1)
	call deoplete#custom#option('max_abbr_width', 35)
	call deoplete#custom#option('max_menu_width', 80)
	call deoplete#custom#option('skip_chars', ['(', ')', '<', '>'])

	call deoplete#custom#var('file', 'enable_buffer_path', 1)

	" Generic source tweaks
	call deoplete#custom#source('buffer', 'rank', 9999)
	call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ deoplete#manual_complete()

endfunction

function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Syntax keywords source for deoplete
" let plug.neco_syntax = {'from': "Shougo/neco-syntax"}

" Code snippets (CoC extension)
let plug.coc_snippets = {'from': "neoclide/coc-snippets", 
			\ 'build': "yarn install --frozen-lockfile"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

