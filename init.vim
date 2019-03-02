" Niflo's vim config.
" niflostancu@gmail.com
"
" Inspired by Rafi's config (https://github.com/rafi/vim-config)
" and SpaceVim (https://github.com/SpaceVim/SpaceVim)
"
" Requires Neovim, python3 etc.

" First, include the utility library
let s:path = fnamemodify(expand('<sfile>:p'), ':h')
execute 'source' fnameescape(s:path . '/config/utils.vim')

" Also include this config dir to runtimepath
execute 'set runtimepath+=' . fnameescape(s:path)

call User_SourceCfg("paths.vim")
call User_SourceCfg("editor.vim")
call User_SourceCfg("plugin_manager.vim")
call User_SourceCfg("theme.vim")

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

