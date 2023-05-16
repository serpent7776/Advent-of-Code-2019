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
		getline;
		mem[pres] = int($0);
		return ip + 2;
	} else if (op == 4) {
		val = value(m1, mem[ip + 1]);
		print val;
		return ip + 2;
	} else if (op == 5) {
		plval = mem[ip + 1];
		if (value(m1, plval) != 0) {
			prval = mem[ip + 2];
			return value(m2, prval);
		}
		return ip + 3;
	} else if (op == 6) {
		plval = mem[ip + 1];
		if (value(m1, plval) == 0) {
			prval = mem[ip + 2];
			return value(m2, prval);
		}
		return ip + 3;
	} else if (op == 7) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3];
		if (value(m1, plval) < value(m2, prval)) {
			mem[pres] = 1;
		} else {
			mem[pres] = 0;
		}
		return ip + 4;
	} else if (op == 8) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3];
		if (value(m1, plval) == value(m2, prval)) {
			mem[pres] = 1;
		} else {
			mem[pres] = 0;
		}
		return ip + 4;
	} else if (op == 99) {
		q = 1;
		return ip;
	} else {
		print "1202 Program Alarm: ", op;
		exit;
	}
}

function init_mem() {
	i = 0;
	cmd = "tr , \"\n\" < input";
	while ((cmd | getline) > 0)
		mem[i++] = int($0);
	close(cmd);
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

BEGIN {
	init_mem();
	exec();
}
