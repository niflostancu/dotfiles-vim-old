" Plugins for Python
let plug = g:user_plugins

" Python syntax, indent & helpers
let plug.python = {'from': "vim-python/python-syntax", "on_ft": "python"}
let plug.python_indent = {'from': "Vimjas/vim-python-pep8-indent", "on_ft": "python"}
let plug.python_fold = {'from': "tmhedberg/SimpylFold", "on_ft": "python"}

" Extends the % motion
let plug.python_match = {'from': "vim-scripts/python_match.vim", "on_ft": "python"}

" Requirements.txt syntax
let plug.python_requirements = {'from': "raimon49/requirements.txt.vim", "on_ft": "requirements"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

