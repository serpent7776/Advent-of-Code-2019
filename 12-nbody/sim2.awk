{
	# initial values
	ixp[NR] = int($1);
	iyp[NR] = int($2);
	izp[NR] = int($3);
	ixv[NR] = int($4);
	iyv[NR] = int($5);
	izv[NR] = int($6);
	# current values
	xp[NR] = int($1);
	yp[NR] = int($2);
	zp[NR] = int($3);
	xv[NR] = int($4);
	yv[NR] = int($5);
	zv[NR] = int($6);
}

function gravity(x, xs,  k) {
	m = 0;
	M = 0;
	for (k = 1; k <= NR; ++k) {
		if (xs[k] < x) m++;
		if (xs[k] > x) M++;
	}
	return M-m;
}

function step(ps, vs,  i) {
	for (i = 1; i <= NR; ++i) {
		vs[i] += gravity(ps[i], ps);
	}
	for (i = 1; i <= NR; ++i) {
		ps[i] += vs[i];
	}
	steps++;
}

function array_eq(a, b,  i) {
	for (i = 1; i <= NR; ++i) {
		if (a[i] != b[i]) return 0;
	}
	return 1;
}

function same(ps, ips, vs, ivs,  i) {
	for (i = 1; i <= NR; ++i) {
		if (!array_eq(ps, ips)) return 0;
		if (!array_eq(vs, ivs)) return 0;
	}
	return 1;
}
