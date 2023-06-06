BEGIN {
	last_angle = 999;
	bc = 0;
	N = 0;
}

function out(line) {
	split(line, c, " ");
	x = c[1];
	y = c[2];
	print(x * 100 + y);
}

{
	if ($3 == last_angle) {
		b[bc++] = $0;
	} else {
		N++;
		if (N == 200) {
			out($0);
		}
	}
	last_angle = $3;
}

END {
	while (length(b) > 0) {
		for (i in b) {
			a[i] = b[i];
		}
		delete b;
		for (i in a) {
			split(a[i], x);
			if (x[3] == last_angle) {
				b[bc++] = a[i];
			} else {
				N++;
				if (N == 200) {
					out(a[i]);
				}
			}
			last_angle = x[3];
		}
		delete a;
		last_angle = 999;
	}
}
