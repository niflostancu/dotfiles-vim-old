" Plugins for configuration files
let plug = g:user_plugins

" Dockerfiles
let plug.dockerfile = {'from': "ekalinin/Dockerfile.vim", "on_ft": ["Dockerfile", "docker-compose"]}

" Log files
let plug.logreview = {'from': "andreshazard/vim-logreview", "on_ft": "logreview"}

" Nginx configuration files
let plug.nginx = {'from': "othree/nginx-contrib-vim", "on_ft": "nginx"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

