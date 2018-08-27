" Plugins for shell languages (Bash, PowerShell etc.)
let plug = g:user_plugins

" PS1 syntax highlight
let plug.powershell = {'from': "PProvost/vim-ps1", "on_ft": "ps1"}

" Shebang pattern detection
let plug.shebang = {'from': "vitalk/vim-shebang", 'lazy': 1}
function! plug.shebang.hook_add() dict
	autocmd UserAuto VimEnter * 
				\ AddShebangPattern! execline ^#!.*/bin/execlineb\s\+
endfunction

" Execline shell script syntax
let plug.execline = {'from': 'djpohly/vim-execline', "on_ft": "execline"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

