function load(mode, val) {
	if (mode == 1) {
		return int(val);
	} else if (mode == 2) {
		return int(mem[rbase + val]);
	} else if (mode == 0) {
		return int(mem[val]);
	} else {
		print "Invalid mode ", mode;
	}
}

function store(mode, addr, val) {
	if (mode == 1) {
		print "immediate mode not supported to store values";
	} else if (mode == 2) {
		mem[rbase + addr] = val;
	} else if (mode == 0) {
		mem[addr] = val;
	} else {
		print "Invalid mode ", mode;
	}
}

function eval(inf, outf, op, ip, m1, m2, m3,    val) {
	if (op == 1) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3]
		lval = load(m1, plval);
		rval = load(m2, prval);
		store(m3, pres, lval + rval);
		return ip + 4;
	} else if (op == 2) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3];
		lval = load(m1, plval);
		rval = load(m2, prval);
		store(m3, pres, lval * rval);
		return ip + 4;
	} else if (op == 3) {
		pres = mem[ip + 1];
		val = @inf()
		store(m1, pres, int(val));
		return ip + 2;
	} else if (op == 4) {
		val = load(m1, mem[ip + 1]);
		@outf(val);
		return ip + 2;
	} else if (op == 5) {
		plval = mem[ip + 1];
		if (load(m1, plval) != 0) {
			prval = mem[ip + 2];
			return load(m2, prval);
		}
		return ip + 3;
	} else if (op == 6) {
		plval = mem[ip + 1];
		if (load(m1, plval) == 0) {
			prval = mem[ip + 2];
			return load(m2, prval);
		}
		return ip + 3;
	} else if (op == 7) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3];
		lval = load(m1, plval)
		rval = load(m2, prval)
		if (lval < rval) {
			store(m3, pres, 1);
		} else {
			store(m3, pres, 0);
		}
		return ip + 4;
	} else if (op == 8) {
		plval = mem[ip + 1];
		prval = mem[ip + 2];
		pres = mem[ip + 3];
		lval = load(m1, plval);
		rval = load(m2, prval);
		if (lval == rval) {
			store(m3, pres, 1);
		} else {
			store(m3, pres, 0);
		}
		return ip + 4;
	} else if (op == 9) {
		plval = mem[ip + 1];
		rbase = rbase + load(m1, plval);
		v = load(m1, plval);
		return ip + 2;
	} else if (op == 99) {
		q = 1;
		return ip;
	} else {
		print "1202 Program Alarm: ", op;
		exit;
	}
}

function exec(inf, outf,    op, op_f, m1, m2, m3, ip) {
	rbase = 0
	ip = 0;
	q = 0;
	while (!q) {
		op_f = mem[ip];
		op = op_f % 100;
		m1 = int((op_f / 100) % 10);
		m2 = int((op_f / 1000) % 10);
		m3 = int((op_f / 10000));
		ip = eval(inf, outf, op, ip, m1, m2, m3);
	}
}
