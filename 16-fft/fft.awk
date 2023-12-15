BEGIN {
	pat[0] = 0
	pat[1] = 1
	pat[2] = 0
	pat[3] = -1
}

function abs(x) {
	return x >= 0 ? x : -x;
}

function fft(value, reps,    n, x, y, p, i, len, sum) {
	split(value, x, "")
	len = length(pat)
	for (n = 0; n < reps; n++)
	{
		for (i in x)
		{
			sum = 0
			for (j in x) {
				p = pat[int((j)/i) % len]
				sum += x[j] * p
			}
			y[i] = abs(sum) % 10
		}
		for (i in x) x[i] = y[i]
	}
	for (n = 1; n <= 8; n++) printf(y[n])
	print("")
}

{
	fft($0, 100)
}
