" Plugins for C-based languages
let plug = vimconf#plugin#register("lang/java")

" Java language server extension for CoC
let plug.coc_java = {'from': "neoclide/coc-java", 
			\ 'build': "yarn install --frozen-lockfile"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

