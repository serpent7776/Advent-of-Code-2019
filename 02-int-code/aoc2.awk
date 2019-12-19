{
	mem[NR - 1] = int($1);
}

function restore_state() {
	mem[1] = 12;
	mem[2] = 2;
}

function eval(op, ip) {
	if (op == 1) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3]
		mem[pres] = mem[plval] + mem[prval];
		return ip + 4;
	} else if (op == 2) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3]
		mem[pres] = mem[plval] * mem[prval];
		return ip + 4;
	} else if (op == 99) {
		q = 1;
		return ip;
	} else {
		print "1202 Program Alarm";
		exit;
	}
}

function exec() {
	ip = 0;
	q = 0;
	while (!q) {
		op = mem[ip];
		ip = eval(op, ip);
	}
}

END {
	restore_state();
	exec();
	print mem[0];
}
