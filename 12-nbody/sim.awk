{
	xp[NR] = int($1);
	yp[NR] = int($2);
	zp[NR] = int($3);
	xv[NR] = int($4);
	yv[NR] = int($5);
	zv[NR] = int($6);
}

function gravity(x, xs) {
	m = 0;
	M = 0;
	for (k = 1; k <= NR; ++k) {
		if (xs[k] < x) m++;
		if (xs[k] > x) M++;
	}
	return M-m;
}

END {
	for (i = 1; i <= NR; ++i) {
		xv[i] += gravity(xp[i], xp);
		yv[i] += gravity(yp[i], yp);
		zv[i] += gravity(zp[i], zp);
	}
	for (i = 1; i <= NR; ++i) {
		xp[i] += xv[i];
		yp[i] += yv[i];
		zp[i] += zv[i];
	}
	for (i = 1; i <= NR; ++i) {
		print(xp[i], yp[i], zp[i], xv[i], yv[i], zv[i]);
	}
}
