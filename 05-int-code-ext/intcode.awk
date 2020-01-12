{
	mem[NR - 1] = int($1);
}

function value(mode, val) {
	if (mode == 1) {
		return val;
	} else if (mode == 0) {
		return mem[val];
	} else {
		print "Invalid mode ", mode
	}
	
}

function eval(op, ip, m1, m2, m3) {
	if (op == 1) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3]
		mem[pres] = value(m1, plval) + value(m2, prval);
		return ip + 4;
	} else if (op == 2) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3]
		mem[pres] = value(m1, plval) * value(m2, prval);
		return ip + 4;
	} else if (op == 3) {
		pres = mem[ip + 1]
		mem[pres] = 1;
		return ip + 2;
	} else if (op == 4) {
		val = value(m1, mem[ip + 1]);
		print val;
		return ip + 2;
	} else if (op == 99) {
		q = 1;
		return ip;
	} else {
		print "1202 Program Alarm: ", op;
		exit;
	}
}

function exec() {
	ip = 0;
	q = 0;
	while (!q) {
		op_f = mem[ip];
		op = op_f % 100;
		m1 = int((op_f / 100) % 10);
		m2 = int((op_f / 1000) % 10);
		m3 = int((op_f / 10000));
		ip = eval(op, ip, m1, m2, m3);
	}
}

END {
	exec();
}
