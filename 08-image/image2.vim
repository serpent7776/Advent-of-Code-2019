" each layer has 25 * 6 = 150 pixels
" split to layers
%s/\d\{150\}/&/g

" disable highlighting
noh

" delete last, empty line
d

function! MergePx(px1, px2)
	if a:px1 == '2'
		return a:px2
	else
		return a:px1
	endif
endfunction

function! Merge(line1, line2)
	return map(a:line1, {idx, px -> MergePx(px, a:line2[idx])})
endfunction

" get first layer
let line = split(getline(1), '\d\zs')

for idx in range(2, 100)
	" get next layer
	let next_line = split(getline(idx), '\d\zs')
	" merge layers
	let line = Merge(line, next_line)
endfor

" join to string
let line = join(line, '')
" split to rows
let lines = split(line, '\w\{25}\zs')
" join with newline
let line = join(lines, "\n")
" replace all 0s with space to be easier to see message
let @+ = substitute(line, '0', ' ', 'g')

" 1      11 1111  11  1  1 
" 1       1 1    1  1 1  1 
" 1       1 111  1    1111 
" 1       1 1    1    1  1 
" 1    1  1 1    1  1 1  1 
" 1111  11  1111  11  1  1 
