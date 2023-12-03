function factors(n, f,       i, k) {
	i = 2;
	k = 0;

	while (n > 1) {
		if (n % i == 0) {
			f[k++] = i;
			n = n / i
		} else {
			i++;
		}
	}
}
