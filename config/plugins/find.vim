" Object finding plugins (i.e. denite, fzf)
let plug = vimconf#plugin#register("find")

" Include the plugins
let plug.denite = {'from': "Shougo/denite.nvim", "on_cmd": "Denite"}
" Location/quickfix list replacement using Denite
let plug.denite_location = {'from': "chemzqm/unite-location", "on_source": "denite.nvim"}

" Fuzzy Finder (note: requires the fzf executable installed externally)
let plug.fzf = {'from': "junegunn/fzf", 'merged': 0, "if": "executable('fzf')"}
let plug.fzfvim = {'from': "junegunn/fzf.vim", 'depends': 'fzf', "if": "executable('fzf')"}

function plug.denite.hook_done_update() dict
	call dein#remote_plugins()
endfunction

function! plug.denite.hook_add() dict
	" Denite shortcuts
	Shortcut (Denite) resume
		\ nnoremap <silent> [find]r :<C-u>Denite -resume -refresh<CR>
	Shortcut (Denite) find files (recursive)
		\ nnoremap <silent> [find]F :<C-u>Denite -start-filter file/rec<CR>
	Shortcut (Denite) switch buffer / most recently opened
		\ nnoremap <silent> [find]B :<C-u>Denite -start-filter buffer file/old -default-action=switch<CR>
	Shortcut (Denite) change directory
		\ nnoremap <silent> [find]d :<C-u>Denite -start-filter directory_rec -default-action=cd<CR>
	Shortcut (Denite) show registers
		\ nnoremap <silent> [find]v :<C-u>Denite -start-filter register -buffer-name=register<CR>
	Shortcut (Denite) open location list
		\ nnoremap <silent> [find]l :<C-u>Denite -start-filter location_list -buffer-name=list<CR>
	Shortcut (Denite) open quickfix
		\ nnoremap <silent> [find]q :<C-u>Denite -start-filter quickfix -buffer-name=list<CR>
	Shortcut (Denite) grep files
		\ nnoremap <silent> [find]g :<C-u>Denite grep<CR>
	Shortcut (Denite) jump to
		\ nnoremap <silent> [find]j :<C-u>Denite -start-filter jump change file/point<CR>
	Shortcut (Denite) show outline
		\ nnoremap <silent> [find]o :<C-u>Denite -start-filter outline<CR>
	Shortcut (Denite) find help
		\ nnoremap <silent> [find]h :<C-u>Denite -start-filter help<CR>
	Shortcut (Denite) find lines in current buffer
		\ nnoremap <silent> [find]/ :<C-u>Denite -start-filter line<CR>
	Shortcut (Denite) find lines containing cursorword
		\ nnoremap <silent> [find]* :<C-u>DeniteCursorWord line<CR>
endfunction

function! plug.fzfvim.hook_add() dict
	let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

	" FZF shortcuts
	Shortcut (FZF) Files
		\ nnoremap <silent> [find]f :<C-u>Files<CR>
	Shortcut (FZF) Buffers
		\ nnoremap <silent> [find]b :<C-u>Buffers<CR>
	Shortcut (FZF) Tags (current word)
		\ nnoremap <silent> [find]; :<C-u>Tags<CR>
	Shortcut (FZF) Tags (current word)
		\ nnoremap <silent> [find]] :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>
endfunction

function! plug.fzfvim.hook_source() dict

	command! -nargs=* Ag
			\ call fzf#vim#grep('ag --nogroup --column --color --hidden ' . 
			\    shellescape(<q-args>), 1)

	command! -nargs=* Agg
			\ call fzf#vim#grep('ag --column --nogroup --color --hidden --max-count 1 ' .
			\    shellescape(<q-args>), 1)

endfunction

function! plug.denite.hook_source() dict

	" Default configuration
	call denite#custom#option('_', {
				\ 'prompt': 'λ:',
				\ 'statusline': v:false,
				\ 'empty': 0,
				\ 'winheight': 16,
				\ 'source_names': 'short',
				\ 'vertical_preview': 1,
				\ 'auto-accel': 1,
				\ 'auto-resume': 1,
				\ })

	" Define mappings
	autocmd FileType denite call s:custom_denite_settings()
	autocmd FileType denite-filter call s:custom_denite_filter_settings()

	call denite#custom#source(
				\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
	"call denite#custom#source(
	"			\ 'file/rec', 'matchers', ['matcher/cpsm'])

	call denite#custom#source(
				\ 'file/rec', 'sorters', ['sorter/sublime'])

	" Change default action.
	"call denite#custom#kind('file', 'default_action', 'split')

	" FIND and GREP COMMANDS
	" call denite#custom#source('grep', 'args', ['', '', '!'])

	if executable('ag')
		" Ag command on grep source
		call denite#custom#var('grep', 'command', ['ag'])
		" Setup ignore patterns in your .agignore file!
		" https://github.com/ggreer/the_silver_searcher/wiki/Advanced-Usage
		call denite#custom#var('grep', 'default_opts',
					\ ['--ignore', '.tags', '-i', '--vimgrep', '--hidden'])
		call denite#custom#var('grep', 'recursive_opts', [])
		call denite#custom#var('grep', 'pattern_opt', [])
		call denite#custom#var('grep', 'separator', ['--'])
		call denite#custom#var('grep', 'final_opts', [])

		" Change file/rec command.
		call denite#custom#var('file/rec', 'command',
					\ ['ag', '--follow', '--hidden', '--nocolor', '--nogroup', '-g', ''])

	elseif executable('ack')
		" Ack command on grep source
		call denite#custom#var('grep', 'command', ['ack'])
		call denite#custom#var('grep', 'default_opts',
					\ ['--ackrc', $HOME.'/.config/ackrc', '-H', '-i',
					\  '--nopager', '--nocolor', '--nogroup', '--column'])
		call denite#custom#var('grep', 'recursive_opts', [])
		call denite#custom#var('grep', 'pattern_opt', ['--match'])
		call denite#custom#var('grep', 'separator', ['--'])
		call denite#custom#var('grep', 'final_opts', [])
	endif

	" Define alias
	call denite#custom#alias('source', 'file/rec/git', 'file/rec')
	call denite#custom#var('file/rec/git', 'command',
				\ ['git', 'ls-files', '-co', '--exclude-standard'])

	" Change ignore_globs
	"call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
	"			\ [ '.git/', '.ropeproject/', '__pycache__/',
	"			\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

endfunction

" Custom denite mappings

function! s:custom_denite_settings() abort
	" Window options
	setlocal signcolumn=no cursorline

	" Key mappings
	nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
	nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> /    denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> dd   denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> st   denite#do_map('do_action', 'tabopen')
	nnoremap <silent><buffer><expr> sg   denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> sv   denite#do_map('do_action', 'split')
	nnoremap <silent><buffer><expr> '    denite#do_map('quick_move')
	nnoremap <silent><buffer><expr> q    denite#do_map('quit')
	nnoremap <silent><buffer><expr> r    denite#do_map('redraw')
	nnoremap <silent><buffer><expr> yy   denite#do_map('do_action', 'yank')
	nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
	nnoremap <silent><buffer><expr><nowait> <Space> denite#do_map('toggle_select').'j'
endfunction

function! s:custom_denite_filter_settings() abort
	" Window options
	setlocal signcolumn=yes nocursorline nonumber norelativenumber
	call deoplete#custom#buffer_option('auto_complete', v:false)

	" Key mappings
	nnoremap <silent><buffer><expr> <Esc>  denite#do_map('quit')
	" inoremap <silent><buffer><expr> <Esc>  denite#do_map('quit')
	nnoremap <silent><buffer><expr> q      denite#do_map('quit')
	inoremap <silent><buffer><expr> <C-c>  denite#do_map('quit')
	nnoremap <silent><buffer><expr> <C-c>  denite#do_map('quit')
	inoremap <silent><buffer>       kk     <Esc><C-w>pk
	nnoremap <silent><buffer>       kk     <C-w>pk
	inoremap <silent><buffer>       jj     <Esc><C-w>pj
	nnoremap <silent><buffer>       jj     <C-w>pj
	inoremap <silent><buffer> <Down>       <Esc><C-w>pj
	nnoremap <silent><buffer> <Down>       <C-w>pj
	inoremap <silent><buffer> <Up>         <Esc><C-w>pk
	nnoremap <silent><buffer> <Up>         <C-w>pj
	" Make Enter do the default action in filter mode
	inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

