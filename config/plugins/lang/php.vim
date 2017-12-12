" Plugins for PHP
let plug = g:user_plugins

" PHP Syntax
let plug.php = {'from': "StanAngeloff/php.vim", "on_ft": "php"}
" PHP indentation script
let plug.php_indent = {'from': "2072/PHP-Indenting-for-VIm", "on_ft": "php"}

" PHP completion daemon
let plug.php_complete = {'from': "lvht/phpcd.vim", "on_ft": "php",
			\ "build": "composer install"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
