" Misc plugins
let plug = vimconf#plugin#register("misc")

" Per-project (local) configuration files
let plug.localrc = {'from': "thinca/vim-localrc"}

" Asynchronous execution library
let plug.vimproc = {'from': "Shougo/vimproc.vim", 'build' : 'make'}

" vim-repeat: library for making third party plugins work with '.'
let plug.repeat = {'from': "tpope/vim-repeat"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

