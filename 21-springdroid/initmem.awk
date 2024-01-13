function init_mem(    i, cmd) {
	i = 0
	cmd = "tr , \"\n\" < input"
	while ((cmd | getline) > 0)
		Mem[i++] = int($0)
	close(cmd)
}

function clear_mem(i) {
	for (i in Mem) {
		mem[i] = Mem[i]
	}
}

BEGIN {
	init_mem()
	clear_mem()
}
