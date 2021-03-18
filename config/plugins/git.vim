" Git integration plugins
let plug = vimconf#plugin#register("git")

let plug.gina = {'from': "lambdalisue/gina.vim", "on_cmd": "Gina"}
function plug.gina.hook_add() dict
	" Gina key bindings
	Shortcut (git/gina) Status
		\ noremap <silent> <Leader>gs :Gina status<CR>
	Shortcut (git/gina) Commit
		\ noremap <silent> <Leader>gc :Gina commit<CR>
	Shortcut (git/gina) Commit (amend)
		\ noremap <silent> <Leader>gC :Gina commit<CR>
	Shortcut (git/gina) Add (stage) current file
		\ noremap <silent> <Leader>ga :Gina add %<CR>
	Shortcut (git/gina) Add (stage) all files
		\ noremap <silent> <Leader>gA :Gina add .<CR>
	Shortcut (git/gina) Diff (global)
		\ noremap <silent> <Leader>gd :Gina diff<CR>
	Shortcut (git/gina) Blame
		\ noremap <silent> <Leader>gb :Gina blame<CR>
endfunction

function plug.gina.hook_source() dict
	" Gina Settings
	let l:gitbotsplit = "bo " . &previewheight . 'split'
	call gina#custom#command#option('status', '--opener', l:gitbotsplit)
	call gina#custom#command#option('status', '--group', 'short')
	call gina#custom#command#option('diff', '--opener', 'wincmd k | edit')
	call gina#custom#command#option('show', '--opener', 'wincmd k | edit')
	call gina#custom#command#option('edit', '--opener', 'wincmd k | edit')
	call gina#custom#command#option('commit', '--opener', l:gitbotsplit)
	call gina#custom#command#option('commit', '--group', 'short')
	call gina#custom#command#option('log', '--opener', l:gitbotsplit)
	call gina#custom#command#option('log', '--group', 'short2')
	call gina#custom#command#option('stash list', '--opener', l:gitbotsplit)
	call gina#custom#command#option('stash list', '--group', 'short2')
endfunction

" Fugitive (required for more advanced git browsing)
let plug.fugitive = {'from': 'tpope/vim-fugitive', "on_cmd": ["Gstatus", "Git"]}

" Flog - git browser
let plug.flog = {'from': 'rbong/vim-flog', "on_cmd": ["Flog", "Flogsplit"]}

" Enhanced commit message editing
let plug.committia = {'from': "rhysd/committia.vim", "on_path": "COMMIT_EDITMSG",
		\ "hook_source": "let g:committia_min_window_width = 70"}

" Git diff gutter
let plug.gitgutter = {'from': "airblade/vim-gitgutter"}

" GH Line - Open Github / Bitbucket / selfhosted git website
let plug.gitghline = {'from': "ruanyl/vim-gh-line"}

" Conflict Marker plugin
let plug.conflict_marker = {'from': "rhysd/conflict-marker.vim"}
function plug.conflict_marker.hook_add() dict
	let g:conflict_marker_enable_mappings = 0
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
