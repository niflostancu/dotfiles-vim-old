" Plugins for Python
let plug = vimconf#plugin#register("lang/python")

" Python syntax, indent & helpers
let plug.python = {'from': "vim-python/python-syntax", "on_ft": "python"}
let plug.python_indent = {'from': "Vimjas/vim-python-pep8-indent", "on_ft": "python"}
let plug.python_fold = {'from': "tmhedberg/SimpylFold", "on_ft": "python"}

" Deoplete plugin
" Requires python-jedi
let plug.deoplete_jedi = {'from': "zchee/deoplete-jedi", "on_ft": "python"}
function plug.deoplete_jedi.hook_source() dict
	let g:deoplete#sources#jedi#statement_length = 30
	let g:deoplete#sources#jedi#show_docstring = 1
	let g:deoplete#sources#jedi#short_types = 1

	autocmd VimCfg FileType python setlocal omnifunc=
endfunction

" Extends the % motion
let plug.python_match = {'from': "vim-scripts/python_match.vim", "on_ft": "python"}

" Requirements.txt syntax
let plug.python_requirements = {'from': "raimon49/requirements.txt.vim", "on_ft": "requirements"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

