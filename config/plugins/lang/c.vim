" Plugins for C-based languages
let plug = vimconf#plugin#register("lang/c")

" Clang autocompletion for deoplete
let plug.deoplete_clangx = {'from': "Shougo/deoplete-clangx"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
