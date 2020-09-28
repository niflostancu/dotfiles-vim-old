" Generic make plugins
let plug = vimconf#plugin#register("make")

" Asynchronous Lint Engine (disabled)
let plug.ale = {'from': "w0rp/ale", "if": 0}
function plug.ale.hook_add() dict
	let g:ale_sign_error = '✖'
	let g:ale_sign_warning = '⚠'
	let g:ale_sign_info = 'ℹ'
	let g:ale_hover_to_preview = 1
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

	Shortcut (make/errors) ALE Error Detail
		\ nmap <silent> <Leader>ee <Plug>(ale_detail)

	Shortcut (make/errors) ALE Documentation
		\ nmap <silent> <Leader>eh <Plug>(ale_documentation)
	Shortcut (make/errors) ALE Find References
		\ nmap <silent> <Leader>er <Plug>(ale_find_references)
	Shortcut (make/errors) ALE Go To Definition
		\ nmap <silent> <Leader>ed <Plug>(ale_go_to_definition)
	Shortcut (make/errors) ALE Fix 
		\ nmap <silent> <Leader>ef <Plug>(ale_fix)

	" show autocomplete on ctrl+space
	imap <C-Space> <Plug>(ale_complete)

endfunction

" Conqueror of Completion
let plug.coc = {'from': 'neoclide/coc.nvim', 'merged':0, 'rev': 'release'}
function plug.coc.hook_add() dict
	" Use tab for trigger completion with characters ahead and navigate.
	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	if has('nvim')
		inoremap <silent><expr> <c-space> coc#refresh()
	else
		inoremap <silent><expr> <c-@> coc#refresh()
	endif

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	if exists('*complete_info')
		inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
		inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif

	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code.
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

endfunction

" Coc Extension Marketplace
let plug.coc_marketplace = {'from': 'fannheyward/coc-marketplace', 'build': 'yarn install --frozen-lockfile'}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

