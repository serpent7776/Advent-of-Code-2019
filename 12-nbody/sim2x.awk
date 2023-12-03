END {
	do {
		step(xp, xv);
	} while (!same(xp, ixp, xv, ixv));
	print(steps);
}
