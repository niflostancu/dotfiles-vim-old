" Plugins for better editing
let plug = vimconf#plugin#register("editor")

" Smart file indent autodetection
let plug.sleuth = {'from': "niflostancu/vim-sleuth"}
function! plug.sleuth.hook_add() dict
	" We use our own custom detection to choose between editorconfig and
	" sleuth
	let g:sleuth_automatic = 0
	let g:sleuth_hard_race = 1
endfunction

" Project .editorconfig detection
let plug.editorconfig = {'from': "editorconfig/editorconfig-vim"}
function! plug.editorconfig.hook_add() dict
	" call Sleuth after EditorConfig
	autocmd VimCfg BufNewFile,BufReadPost,BufFilePost * :Sleuth
endfunction

" Faster parenthesis matching
let plug.parenmatch = {'from': "itchyny/vim-parenmatch"}

" Underlines the word under the cursor
let plug.cursorword = {'from': "itchyny/vim-cursorword"}
function! plug.cursorword.hook_add() dict
	" Disable it by default
	let g:cursorword=0
	" Disable for special buffers
	autocmd VimCfg FileType denite,qf,nerdtree let b:cursorword=0
endfunction

" Commenting plugin
let plug.tcomment = {'from': "tomtom/tcomment_vim"}

" Incremental search (new version)
let plug.incsearch = {'from': "haya14busa/is.vim"}
function plug.incsearch.hook_add() dict
	let g:is#do_default_mappings = 1
endfunction

" Improved *asterisk (search current word)
let plug.asterisk = {'from': "haya14busa/vim-asterisk"}
function plug.asterisk.hook_add() dict
	map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
	map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
	map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
	map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)

	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
endfunction

" Preview :substitute
let plug.over = {'from': "osyo-manga/vim-over"}

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

