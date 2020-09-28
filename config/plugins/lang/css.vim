" Plugins for CSS
let plug = vimconf#plugin#register("lang/css")

" Syntaxes for CSS / SCSS / LESS
let plug.css_syntax = {'from': "hail2u/vim-css3-syntax", "on_ft": "css"}
let plug.scss_syntax = {'from': "cakebaker/scss-syntax.vim", "on_ft": ["css", "scss", "sass"]}
let plug.less_syntax = {'from': "groenewege/vim-less", "on_ft": "less"}
" CSS coloring!
let plug.css_color = {'from': "ap/vim-css-color", "on_ft": ["css", "scss", "sass"]}

" CSS language server extension for CoC
let plug.coc_css = {'from': "neoclide/coc-css", 
			\ 'build': "yarn install --frozen-lockfile"}
let plug.coc_cssmodules = {'from': "antonk52/coc-cssmodules", 
			\ 'build': "yarn install --frozen-lockfile"}

let plug.styled_components = {'from': 'styled-components/vim-styled-components', "on_ft": "javascript"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

