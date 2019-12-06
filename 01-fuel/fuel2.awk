function fuel(mass, acc) {
	f = int(mass / 3) - 2;
	if (f <= 0) {
		return acc;
	}
	return fuel(f, f + acc);
}
BEGIN{sum=0}
{sum = sum + fuel($1, 0)}
END{print sum}
