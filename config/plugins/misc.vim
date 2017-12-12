" Misc plugins
let plug = g:user_plugins

" Per-project (local) configuration files
let plug.localrc = {'from': "thinca/vim-localrc"}

" Asynchronous execution library
let plug.vimproc = {'from': "Shougo/vimproc.vim", 'build' : 'make'}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

