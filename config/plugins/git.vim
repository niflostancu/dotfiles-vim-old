" Git integration plugins
let plug = g:user_plugins

let plug.gina = {'from': "lambdalisue/gina.vim", "on_cmd": "Gina"}

let plug.committia = {'from': "rhysd/committia.vim", "on_path": "COMMIT_EDITMSG",
		\ "hook_source": "let g:committia_min_window_width = 70"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :


