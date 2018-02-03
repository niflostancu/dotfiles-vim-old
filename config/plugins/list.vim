" Objects listing (i.e. denite, fzf) plugins
let plug = g:user_plugins

" Include the plugins
let plug.denite = {'from': "Shougo/denite.nvim", "on_cmd": "Denite"}
" Location/quickfix list replacement using Denite
let plug.denite_location = {'from': "chemzqm/unite-location", "on_source": "denite.nvim"}

" Fuzzy Finder (note: requires the fzf executable installed externally)
let plug.fzf = {'from': "junegunn/fzf", 'merged': 0, "if": "executable('fzf')"}
let plug.fzfvim = {'from': "junegunn/fzf.vim", "if": "executable('fzf')"}

function plug.denite.hook_done_update() dict
	call dein#remote_plugins()
endfunction

function! plug.denite.hook_add() dict
	" Denite shortcuts
	Shortcut (Denite) resume
		\ nnoremap <silent> [denite]r :<C-u>Denite -resume -refresh<CR>
	Shortcut (Denite) find files (recursive)
		\ nnoremap <silent> [denite]F :<C-u>Denite file_rec<CR>
	Shortcut (Denite) switch buffer / most recently opened
		\ nnoremap <silent> [denite]B :<C-u>Denite buffer file_old -default-action=switch<CR>
	Shortcut (Denite) change directory
		\ nnoremap <silent> [denite]d :<C-u>Denite directory_rec -default-action=cd<CR>
	Shortcut (Denite) show registers
		\ nnoremap <silent> [denite]v :<C-u>Denite register -buffer-name=register<CR>
	Shortcut (Denite) open location list
		\ nnoremap <silent> [denite]l :<C-u>Denite location_list -buffer-name=list<CR>
	Shortcut (Denite) open quickfix
		\ nnoremap <silent> [denite]q :<C-u>Denite quickfix -buffer-name=list<CR>
	Shortcut (Denite) grep files
		\ nnoremap <silent> [denite]g :<C-u>Denite grep<CR>
	Shortcut (Denite) jump to
		\ nnoremap <silent> [denite]j :<C-u>Denite jump change file_point<CR>
	Shortcut (Denite) show outline
		\ nnoremap <silent> [denite]o :<C-u>Denite outline<CR>
	Shortcut (Denite) find help
		\ nnoremap <silent> [denite]h :<C-u>Denite help<CR>
	Shortcut (Denite) find lines in current buffer
		\ nnoremap <silent> [denite]/ :<C-u>Denite line<CR>
	Shortcut (Denite) find lines containing cursorword
		\ nnoremap <silent> [denite]* :<C-u>DeniteCursorWord line<CR>
endfunction

function! plug.fzf.hook_add() dict
	" Denite shortcuts
	Shortcut (FZF) Files
		\ nnoremap <silent> [denite]f :<C-u>Files<CR>
	Shortcut (FZF) Buffers
		\ nnoremap <silent> [denite]b :<C-u>Buffers<CR>
	Shortcut (FZF) Tags (current word)
		\ nnoremap <silent> [denite]; :<C-u>Tags<CR>
	Shortcut (FZF) Tags (current word)
		\ nnoremap <silent> [denite]] :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>
endfunction
function plug.denite.hook_source() dict
	" Denite configuration
	call denite#custom#option('_', {
				\ 'prompt': 'λ:',
				\ 'empty': 0,
				\ 'winheight': 16,
				\ 'source_names': 'short',
				\ 'vertical_preview': 1,
				\ 'auto-accel': 1,
				\ 'auto-resume': 1,
				\ })

	call denite#custom#option('list', {})

	" MATCHERS
	" Default is 'matcher_fuzzy'
	call denite#custom#source('tag', 'matchers', ['matcher_substring'])
	if has('nvim') && &runtimepath =~# '\/cpsm'
		call denite#custom#source(
					\ 'buffer,file_mru,file_old,file_rec,grep,mpc,line',
					\ 'matchers', ['matcher_cpsm', 'matcher_fuzzy'])
	endif

	" CONVERTERS
	call denite#custom#source(
				\ 'buffer,file_mru,file_old',
				\ 'converters', ['converter_relative_word'])

	" FIND and GREP COMMANDS
	if executable('ag')
		" The Silver Searcher
		call denite#custom#var('file_rec', 'command',
					\ ['ag', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])

		" Setup ignore patterns in your .agignore file!
		" https://github.com/ggreer/the_silver_searcher/wiki/Advanced-Usage

		call denite#custom#var('grep', 'command', ['ag'])
		call denite#custom#var('grep', 'recursive_opts', [])
		call denite#custom#var('grep', 'pattern_opt', [])
		call denite#custom#var('grep', 'separator', ['--'])
		call denite#custom#var('grep', 'final_opts', [])
		call denite#custom#var('grep', 'default_opts',
					\ [ '--ignore', '.tags', '--vimgrep', '--smart-case', '--hidden' ])

	elseif executable('ack')
		" Ack command
		call denite#custom#var('grep', 'command', ['ack'])
		call denite#custom#var('grep', 'recursive_opts', [])
		call denite#custom#var('grep', 'pattern_opt', ['--match'])
		call denite#custom#var('grep', 'separator', ['--'])
		call denite#custom#var('grep', 'final_opts', [])
		call denite#custom#var('grep', 'default_opts',
					\ ['--ackrc', $HOME.'/.config/ackrc', '-H',
					\ '--nopager', '--nocolor', '--nogroup', '--column'])
	endif

	" KEY MAPPINGS
	let insert_mode_mappings = [
				\  ['jj', '<denite:enter_mode:normal>', 'noremap'],
				\  ['<Esc>', '<denite:quit>', 'noremap'],
				\  ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
				\  ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
				\  ['<Up>', '<denite:move_to_previous_line>', 'noremap'],
				\  ['<Down>', '<denite:move_to_next_line>', 'noremap'],
				\  ['<C-Up>', '<denite:assign_previous_text>', 'noremap'],
				\  ['<C-Down>', '<denite:assign_next_text>', 'noremap'],
				\  ['<C-R>', '<denite:redraw>', 'noremap'],
				\ ]

	let normal_mode_mappings = [
				\  ["'", '<denite:toggle_select_down>', 'noremap'],
				\  ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
				\  ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
				\  ['gg', '<denite:move_to_first_line>', 'noremap'],
				\  ['st', '<denite:do_action:tabopen>', 'noremap'],
				\  ['sg', '<denite:do_action:vsplit>', 'noremap'],
				\  ['sv', '<denite:do_action:split>', 'noremap'],
				\  ['sc', '<denite:quit>', 'noremap'],
				\  ['r', '<denite:redraw>', 'noremap'],
				\  ['<Esc>', '<denite:quit>', 'noremap'],
				\ ]

	for m in insert_mode_mappings
		call denite#custom#map('insert', m[0], m[1], m[2])
	endfor
	for m in normal_mode_mappings
		call denite#custom#map('normal', m[0], m[1], m[2])
	endfor

endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :

