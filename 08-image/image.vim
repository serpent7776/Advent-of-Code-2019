" each layer has 25 * 6 = 150 pixels
" split to layers
%s/\d\{150\}/&/g

" disable highlighting
noh

" delete last, empty line
d

" prepend number of 0's to beginning of line
%g/^/execute 'normal I' . count(expand('<cword>'), '0') . ' '

noh

" sort numerically by count of 0's
" layer with fewest 0's will after that be the first line in buffer
%sort n

" delete number of 0's as  it's no longer needed
normal dw

" write number of 1's to q rogister and number of 2's to w register
let @q = count(expand('<cword>'), '1')
let @w = count(expand('<cword>'), '2')

" calculate final answer and put it in system clipboard
let @+ = @q * @w
