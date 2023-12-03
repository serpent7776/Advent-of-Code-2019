END {
	do {
		step(yp, yv);
	} while (!same(yp, iyp, yv, iyv));
	print(steps);
}
