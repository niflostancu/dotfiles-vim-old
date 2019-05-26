" Show the output of any command in a Scratch buffer
function! s:Scratch (command, ...)
	redir => lines
	let saveMore = &more
	set nomore
	execute 'silent' a:command
	redir END
	let &more = saveMore
	call feedkeys("\<cr>")
	new | setlocal buftype=nofile bufhidden=hide noswapfile
	put=lines
	if a:0 > 0
		execute 'vglobal/'.a:1.'/delete'
	endif
	if a:command == 'scriptnames'
		%substitute#^[[:space:]]*[[:digit:]]\+:[[:space:]]*##e
	endif
	silent %substitute/\%^\_s*\n\|\_s*\%$
	let height = line('$') + 3
	execute 'normal! z'.height."\<cr>"
	0
endfunction

" Map the Scratch, + scriptnames
command! -nargs=? Scriptnames call <sid>Scratch('scriptnames', <f-args>)
command! -nargs=+ Scratch call <sid>Scratch(<f-args>)

" Close all hidden buffers
command! BuffersCleanup call s:BuffersCleanup()
function! s:BuffersCleanup()
	let open_buffers = []

	for i in range(tabpagenr('$'))
		call extend(open_buffers, tabpagebuflist(i + 1))
	endfor

	for num in range(1, bufnr("$") + 1)
		if buflisted(num) && index(open_buffers, num) == -1
			exec "bdelete ".num
		endif
	endfor
endfunction

" Change indent width
command! IndentWidth call s:IndentWidth()
function! s:IndentWidth(...)
	let l:width = 4
	if a:0 >= 1 && a:1 =~# '^\d\+$'
		let l:width = a:1 
	endif

	let &l:tabstop = l:width
	let &l:softtabstop = 0
	let &l:shiftwidth = l:width
endfunction

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
