" Plugins for shell languages (Bash, PowerShell etc.)
let plug = vimconf#plugin#register("lang/shell")

" PS1 syntax highlight
let plug.powershell = {'from': "PProvost/vim-ps1", "on_ft": "ps1"}

" Shebang pattern detection
let plug.shebang = {'from': "vitalk/vim-shebang", "if": 1}
function! plug.shebang.hook_add() dict
	autocmd VimCfg VimEnter * 
				\ AddShebangPattern! execline ^#!.*/bin/execlineb\s\+
endfunction

" Execline shell script syntax
let plug.execline = {'from': 'djpohly/vim-execline', "on_ft": "execline"}

" Bash language server extension for CoC
let plug.coc_sh = {'from': "josa42/coc-sh",
			\ 'build': "yarn install --frozen-lockfile"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

