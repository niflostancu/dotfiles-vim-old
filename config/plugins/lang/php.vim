" Plugins for PHP
let plug = vimconf#plugin#register("lang/php")

" PHP Syntax
let plug.php = {'from': "StanAngeloff/php.vim"}
" PHP indentation script
let plug.php_indent = {'from': "2072/PHP-Indenting-for-VIm"}

" PHP language server extension for CoC
let plug.coc_php = {'from': "phpactor/coc-phpactor",
			\ 'build': "yarn install --frozen-lockfile"}
" alternate: "marlonfan/coc-phpls"

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
