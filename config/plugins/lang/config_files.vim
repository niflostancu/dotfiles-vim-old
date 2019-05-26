" Plugins for configuration files
let plug = vimconf#plugin#register("lang/config_files")

" Dockerfiles
let plug.dockerfile = {'from': "ekalinin/Dockerfile.vim", "on_ft": ["Dockerfile", "docker-compose"]}

" Vagrant
let plug.vagrant = {'from': "hashivim/vim-vagrant", "on_ft": ["ruby"]}

" Log files
let plug.logreview = {'from': "andreshazard/vim-logreview", "on_ft": "logreview"}

" Nginx configuration files
let plug.nginx = {'from': "othree/nginx-contrib-vim", "on_ft": "nginx"}

" Saltstack files
let plug.saltstack = {'from': "saltstack/salt-vim", "on_ft": "sls"}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

