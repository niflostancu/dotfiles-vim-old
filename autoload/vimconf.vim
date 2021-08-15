" VimConfig library
let s:vimconf_dir = expand('<sfile>:p:h:h') . '/config'

function! vimconf#init()
	" Init absolute path to our vim config directory
	let g:vimconf_dir = s:vimconf_dir
	let g:vimconf_cache_dir = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache').'/nvim')
	" export as environment variable for ease of use
	let $VIM_CACHE = g:vimconf_cache_dir
	let g:dein#install_log_filename = g:vimconf_cache_dir . "/dein.log"

	" AutoCmd group
	augroup VimCfg
		autocmd!
	augroup END

	" Add local/ to rtp
	execute 'set runtimepath+=' . fnameescape(fnamemodify(g:vimconf_dir, ":h") . "/local")

endfunction

" Sources a configuration file (relative to the config/ directory)
function! vimconf#source(file)
	execute 'source' fnameescape(g:vimconf_dir . '/' . a:file)
endfunction

" Sources a configuration file (relative to the config/ directory)
function! vimconf#source_optional(file)
	let l:file_path = g:vimconf_dir . '/' . a:file
	if filereadable(l:file_path)
		execute 'source' fnameescape(l:file_path)
	endif
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

