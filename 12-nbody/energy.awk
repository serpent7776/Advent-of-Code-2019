{
	xp[NR] = int($1);
	yp[NR] = int($2);
	zp[NR] = int($3);
	xv[NR] = int($4);
	yv[NR] = int($5);
	zv[NR] = int($6);
}

function abs(x) {
	return x > 0 ? x : -x;
}

END {
	for (i = 1; i <= NR; ++i) {
		Ep = abs(xp[i]) + abs(yp[i]) + abs(zp[i]);
		Ek = abs(xv[i]) + abs(yv[i]) + abs(zv[i]);
		E += Ep*Ek;
	}
	print(E);
}
