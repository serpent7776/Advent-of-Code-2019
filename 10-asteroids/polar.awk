BEGIN {
	split(xy, s, " ");
	sx = s[1];
	sy = s[2];
	row = 0;
	pi = atan2(0, -1);
	pi_2 = pi / 2;
}

{
	split($0, ch, "");
	n = length($0);
	for (col = 0; col < n; ++col) {
		a[row, col] = ch[col + 1];
	}
	row++;
}

function abs(x) {
	return x > 0 ? x : -x;
}

function len2(x, y) {
	dx = abs(x - sx);
	dy = abs(y - sy);
	return dx*dx + dy*dy;
}

function angle(x, y) {
	# x and y coordinates are swapped, on purpose to make calculations easier
	theta = atan2(x - sx, sy - y);
	# Make sure all angles are non-negative, because we start at angle 0
	if (theta < 0) theta += 2 * pi;
	return theta;
}

END {
	rows = row;
	cols = col;
	for (x = 0; x < rows; ++x)
		for (y = 0; y < cols; ++y)
			if (a[y, x] == "#" && len2(x, y) > 0)
				print(x ,y, angle(x, y), len2(x, y));
}
