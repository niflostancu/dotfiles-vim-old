" Plugins for Vimscript
let plug = vimconf#plugin#register("lang/vim")

" Enhanced syntax
let plug.vim_syntax = {'from': "vim-jp/syntax-vim-ex", "on_ft": "vim"}

" VimL language server extension for CoC
let plug.coc_latex = {'from': "iamcco/coc-vimlsp",
			\ 'build': "yarn install --frozen-lockfile"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
