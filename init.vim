" Niflo's vim config.
" niflostancu@gmail.com
"
" Inspired by Rafi's config (https://github.com/rafi/vim-config)
" and SpaceVim (https://github.com/SpaceVim/SpaceVim)
"
" Requires Neovim, python3 etc.

" Include this dir to runtimepath
let s:path = expand('<sfile>:p:h')
execute 'set runtimepath+=' . fnameescape(s:path)

" Init config and load
call vimconf#init()

call vimconf#plugin#source()
call vimconf#source_optional("plugins.local.vim")
call vimconf#plugin#source_theme("one")

call vimconf#plugin#load()

" call vimconf#source("stock_plugins.vim")
call vimconf#source("paths.vim")
call vimconf#source("editor.vim")

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

