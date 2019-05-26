" UI: NerdTree configuration
let plug = vimconf#plugin#register("nerdtree")

let plug.nerdtree = {'from': "scrooloose/nerdtree", "on_map": {"n": "<Plug>"}, 
			\ "on_cmd": "NERDTree"}
let plug.nerdtree_git = {'from': "Xuyuanp/nerdtree-git-plugin", "on_source": "nerdtree"}

function plug.nerdtree.hook_add() dict
	" Key bindings
	Shortcut (NERDTree) Toggle
		\ noremap <silent> <F3> :NERDTreeToggle<CR>
	Shortcut (NERDTree) Toggle (alt)
	  \ noremap <silent> [find]e :NERDTreeToggle<CR>
	Shortcut (NERDTree) Find current file
		\ noremap <silent> [find]a :NERDTreeFind<CR>

endfunction

function plug.nerdtree.hook_source() dict
	let g:NERDTreeMinimalUI = 1
	let g:NERDTreeWinSize = 31
	let g:NERDTreeCascadeOpenSingleChildDir = 1
	let g:NERDTreeCascadeSingleChildDir = 0
	let g:NERDTreeShowHidden = 0
	let g:NERDTreeRespectWildIgnore = 0
	let g:NERDTreeAutoDeleteBuffer = 1
	let g:NERDTreeChDirMode = 0  " CWD when changing root dir
	let g:NERDTreeQuitOnOpen = 0
	let g:NERDTreeHijackNetrw = 1
	let g:NERDTreeBookmarksFile = $VIM_CACHE.'/treemarks'
	let g:NERDTreeIgnore = [
				\ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.svn$',
				\ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.cache$'
				\ ]

	autocmd VimCfg FileType nerdtree call s:nerdtree_settings()
endfunction

function plug.nerdtree.hook_post_source() dict

	call NERDTreeAddKeyMap({
				\ 'key': 'C',
				\ 'callback': 'NERDTree_EnhancedCHR',
				\ 'quickhelpText': 'Switch root + Change Dir + tcd',
				\ 'scope': 'DirNode' })

endfunction

" Changes the root directory with neovim "tcd" integration
function! NERDTree_EnhancedCHR(node)
	call b:NERDTree.changeRoot(a:node)

	if exists(":tcd")
		execute 'tcd' fnameescape(a:node.path.str())
	else
		execute 'cd' fnameescape(a:node.path.str())
	endif
	call nerdtree#echo("CWD is now: " . a:node.path.str())
endfunction

function! s:nerdtree_settings() abort
	setlocal expandtab " Enable vim-indent-guides
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
