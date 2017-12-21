" Plugins for better editing
let plug = g:user_plugins

" Smart file indent autodetection
let plug.sleuth = {'from': "tpope/vim-sleuth"}
function! plug.sleuth.hook_source() dict
	let g:sleuth_automatic = 0
endfunction

" Project .editorconfig detection
let plug.editorconfig = {'from': "editorconfig/editorconfig-vim"}

" Faster parenthesis matching
let plug.parenmatch = {'from': "itchyny/vim-parenmatch"}

" Underlines the word under the cursor
let plug.cursorword = {'from': "itchyny/vim-cursorword"}
function! plug.cursorword.hook_add() dict
	" Disable for special buffers
	autocmd UserAuto FileType denite,qf,nerdtree let b:cursorword=0
endfunction

" Commenting plugin
let plug.tcomment = {'from': "tomtom/tcomment_vim"}

" Find and Replace in multiple files
let plug.far = {'from': "brooth/far.vim", "on_cmd": ["Far", "Farp", "F"]}

" Easy motion
let plug.easymotion = {'from': "easymotion/vim-easymotion", "on_map": {"n": "<Plug>"}}
function! plug.easymotion.hook_source() dict
	let g:EasyMotion_do_mapping = 0
	let g:EasyMotion_prompt = 'Jump to → '
	let g:EasyMotion_keys = 'fjdksweoavn'
	let g:EasyMotion_smartcase = 1
	let g:EasyMotion_use_smartsign_us = 1
endfunction

" Highlight / tag on the fly
let plug.quickhl = {'from': "t9md/vim-quickhl", "on_map": {"nv": "<Plug>"}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

