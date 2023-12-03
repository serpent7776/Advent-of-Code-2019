END {
	do {
		step(zp, zv);
	} while (!same(zp, izp, zv, izv));
	print(steps);
}
