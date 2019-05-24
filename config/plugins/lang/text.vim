" Plugins for text languages (e.g. Markdown)
let plug = g:user_plugins

" Tabular data formatting
let plug.tabular = {'from': "godlygeek/tabular", "on_cmd": "Tabularize"}

" CSV syntax
let plug.csv = {'from': "chrisbra/csv.vim", "on_ft": "csv"}

" Original Markdown syntax
let plug.markdown = {'from': "plasticboy/vim-markdown", "on_ft": "markdown"}
function! plug.markdown.hook_add() dict
	let g:vim_markdown_override_foldtext = 0
	let g:vim_markdown_initial_foldlevel = 999
	let g:vim_markdown_new_list_item_indent = 2
	let g:vim_markdown_frontmatter = 1
	let g:vim_markdown_conceal = 0
	let g:vim_markdown_fenced_languages = [
				\ 'c++=cpp', 'viml=vim',
				\ 'bash=sh', 'ini=dosini'
				\ ]
endfunction

" Github-flavored Markdown
let plug.markdown_gh = {'from': "rhysd/vim-gfm-syntax", "depends":
			\ "vim-markdown", "on_ft": "markdown"}
function! plug.markdown_gh.hook_source() dict
	let g:gfm_syntax_enable_always = 0
	let g:gfm_syntax_highlight_emoji = 0
	let g:gfm_syntax_enable_filetypes = ['markdown']
endfunction

" LaTeX FTW
let plug.vimtex = {'from': 'lervag/vimtex', "on_ft": ["plaintex", "tex", "bib"]}
function! plug.vimtex.hook_add() dict
	let g:vimtex_compiler_progname = 'nvr'
	let g:vimtex_quickfix_mode = 0
	let g:vimtex_quickfix_open_on_warning = 0
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

