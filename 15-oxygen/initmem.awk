function init_mem() {
	i = 0;
	cmd = "tr , \"\n\" < input";
	while ((cmd | getline) > 0)
		mem[i++] = int($0);
	close(cmd);
}

BEGIN {
	init_mem();
}
