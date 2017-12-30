" This file initializes the Shougo/dein.vim plugin manager.
"
" See config/paths.vim for the directories used for installing the plugins.

let s:dein_cache = $VIM_CACHE . "/dein"
let s:dein_dir = s:dein_cache."/repos/github.com/Shougo/dein.vim"

if &runtimepath !~# '/dein.vim'
	if ! isdirectory(s:dein_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
	endif

	execute 'set runtimepath+='.substitute(
		\ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

let s:dein_plugins = User_LoadPlugins()

if dein#load_state(s:dein_cache)
	call dein#begin(s:dein_cache, [expand('<sfile>')] +
				\ split(globpath(expand('$VIM_CONFIG/'), '**/*.vim'), '\n'))
	
	let dein#_hook_add = 'call User_SourceCfg("mappings.vim")' . "\n"

	call dein#add(s:dein_dir)
	call dein#add("sunaku/vim-shortcut", {'lazy': 1,
				\ "hook_add": "call User_SourceCfg(\"mappings.vim\")"})
	call dein#load_dict(s:dein_plugins)

	call dein#end()
	call dein#save_state()
	if dein#check_install()
		call dein#install()
	endif
endif

filetype plugin indent on
syntax enable

" Disable pre-bundled plugins
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwSettings = 1
let g:loaded_rrhelper = 1
let g:loaded_ruby_provider = 1
let g:loaded_shada_plugin = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

