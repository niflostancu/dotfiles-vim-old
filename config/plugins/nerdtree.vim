" UI: NerdTree configuration
let plug = g:user_plugins

let plug.nerdtree = {'from': "scrooloose/nerdtree", "on_map": {"n": "<Plug>"}, 
			\ "on_cmd": "NERDTree"}
function plug.nerdtree.hook_source() dict
	let g:NERDTreeMinimalUI = 1
	let g:NERDTreeWinSize = 31
	let g:NERDTreeCascadeOpenSingleChildDir = 1
	let g:NERDTreeCascadeSingleChildDir = 0
	let g:NERDTreeShowHidden = 0
	let g:NERDTreeRespectWildIgnore = 0
	let g:NERDTreeAutoDeleteBuffer = 1
	let g:NERDTreeQuitOnOpen = 0
	let g:NERDTreeHijackNetrw = 1
	let g:NERDTreeBookmarksFile = $VIM_CACHE.'/treemarks'
	let g:NERDTreeIgnore = [
				\ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.svn$',
				\ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.cache$'
				\ ]

	autocmd UserAuto FileType nerdtree call s:nerdtree_settings()
endfunction

function plug.nerdtree.hook_add() dict
	" Key bindings
	Shortcut (NERDTree) Toggle
		\ noremap <silent> <F3> :NERDTreeToggle<CR>
	Shortcut (NERDTree) Toggle (alt)
	  \ noremap <silent> [denite]e :NERDTreeToggle<CR>
	Shortcut (NERDTree) Find current file
		\ noremap <silent> [denite]a :NERDTreeFind<CR>

endfunction

function! s:nerdtree_settings() abort
	setlocal expandtab " Enable vim-indent-guides
endfunction

let plug.nerdtree_git = {'from': "Xuyuanp/nerdtree-git-plugin", "on_source": "nerdtree"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
