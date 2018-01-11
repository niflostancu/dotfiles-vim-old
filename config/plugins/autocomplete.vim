" Autocompletion plugins
let plug = g:user_plugins

" Context file type library
let plug.context_filetype = {'from': "Shougo/context_filetype.vim"}

" Deoplete - asynchronous autocompletion
let plug.deoplete = {'from': "Shougo/deoplete.nvim"}

function plug.deoplete.hook_done_update() dict
	call dein#remote_plugins()
endfunction

function plug.deoplete.hook_add() dict
	let g:deoplete#enable_at_startup = 1

	" Deoplete settings
	let g:deoplete#auto_complete_delay = 50
	let g:deoplete#auto_refresh_delay = 500
	let g:deoplete#enable_refresh_always = 0
	let g:deoplete#enable_camel_case = 1
	let g:deoplete#max_abbr_width = 35
	let g:deoplete#max_menu_width = 20
	let g:deoplete#skip_chars = ['(', ')', '<', '>']

	let g:deoplete#tag#cache_limit_size = 5000000
	let g:deoplete#file#enable_buffer_path = 1

	" Generic source tweaks
	call deoplete#custom#source('buffer', 'rank', 9999)
	call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ deoplete#mappings#manual_complete()

endfunction

function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Syntax keywords source for deoplete
let plug.neco_syntax = {'from': "Shougo/neco-syntax"}

" Code snippets
let plug.neosnippet = {'from': "Shougo/neosnippet.vim", "depends": [
			\ "neosnippet-snippets", "context_filetype.vim"], "on_event": "InsertCharPre", "on_ft": "snippet",
			\ "hook_add": "let g:neosnippet#data_directory = $VIM_CACHE.'/snippets'"}
let plug.snippets = {'from': "Shougo/neosnippet-snippets"}

function plug.neosnippet.hook_source() dict
	let g:neosnippet#enable_snipmate_compatibility = 1
	let g:neosnippet#enable_completed_snippet = 1
	let g:neosnippet#expand_word_boundary = 1
	autocmd UserAuto InsertLeave * NeoSnippetClearMarkers
endfunction

" Echo function docs in cmd line
let plug.echodoc = {'from': "Shougo/echodoc.vim", "on_event": "CompleteDone"}
function plug.echodoc.hook_post_source() dict
	call echodoc#enable()
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

