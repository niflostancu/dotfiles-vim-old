" Niflo's vim config.
" niflostancu@gmail.com
"
" Inspired by Rafi's config (https://github.com/rafi/vim-config)
" and SpaceVim (https://github.com/SpaceVim/SpaceVim)
"
" Requires Neovim, python3 etc.

" First, include the utility library
execute 'source' fnameescape(fnamemodify(expand('<sfile>:p'), ':h').'/config/utils.vim')

call User_SourceCfg("paths.vim")
call User_SourceCfg("editor.vim")
call User_SourceCfg("plugin_manager.vim")
call User_SourceCfg("theme.vim")

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

