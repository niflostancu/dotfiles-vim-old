" Plugins for C-based languages
let plug = vimconf#plugin#register("lang/c")

" Clang language server extension for CoC
let plug.coc_clang = {'from': "clangd/coc-clangd", 
			\ 'build': "yarn install --frozen-lockfile"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
