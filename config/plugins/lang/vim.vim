" Plugins for Vimscript
let plug = vimconf#plugin#register("lang/vim")

" Enhanced syntax
let plug.vim_syntax = {'from': "vim-jp/syntax-vim-ex", "on_ft": "vim"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
