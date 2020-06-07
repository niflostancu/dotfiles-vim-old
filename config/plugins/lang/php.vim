" Plugins for PHP
let plug = vimconf#plugin#register("lang/php")

" PHP Syntax
let plug.php = {'from': "StanAngeloff/php.vim"}
" PHP indentation script
let plug.php_indent = {'from': "2072/PHP-Indenting-for-VIm"}

" PHP completion daemon
let plug.php_complete = {'from': "lvht/phpcd.vim", "on_ft": "php",
			\ "build": "composer install"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
