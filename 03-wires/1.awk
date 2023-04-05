BEGIN {
	x=0;
	y=0;
}

function abssum(a, b) {
	return (a < 0 ? -a : a) +
		(b < 0 ? -b : b);
}

# first wire

/R x \d+/ {
	d = $3;
	for (i = 1; i <= d; ++i) {
		a[x + i, y] = "x";
	}
	x += d;
}
/L x \d+/ {
	d = $3;
	for (i = 1; i <= d; ++i) {
		a[x - i, y] = "x";
	}
	x -= d;
}
/U x \d+/ {
	d = $3;
	for (i = 1; i <= d; ++i) {
		a[x, y + i] = "x";
	}
	y += d;
}
/D x \d+/ {
	d = $3;
	for (i = 1; i <= d; ++i) {
		a[x, y - i] = "x";
	}
	y -= d;
}

# reset

/--/ {
	x = 0;
	y = 0;
}

# second wire

/R o \d+/ {
	d = $3;
	for (i = 1; i <= d; ++i) {
		nx = x + i;
		if (a[nx, y]) {
			print nx, y, abssum(nx, y);
		}
	}
	x += d;
}
/L o \d+/ {
	d = $3;
	for (i = 1; i <= d; ++i) {
		nx = x - i;
		if (a[nx, y]) {
			print nx, y, abssum(nx, y);
		}
	}
	x -= d;
}
/U o \d+/ {
	d = $3;
	for (i = 1; i <= d; ++i) {
		ny = y + i
		if (a[x, ny]) {
			print x, ny, abssum(x, ny);
		}
	}
	y += d;
}
/D o \d+/ {
	d = $3;
	for (i = 1; i <= d; ++i) {
		ny = y - i
		if (a[x, ny]) {
			print x, ny, abssum(x, ny);
		}
	}
	y -= d;
}
