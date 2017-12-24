" Plugins for C-based languages
let plug = g:user_plugins

" Clang autocompletion for deoplete
let plug.deoplete_clang2 = {'from': "tweekmonster/deoplete-clang2"}

function plug.deoplete_clang2.hook_source() dict
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
