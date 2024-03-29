BEGIN {
	row = 0;
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

function max(a, b) {
	return a > b ? a : b;
}

END {
	rows = row;
	cols = col;
	best = 0;
	best_x = 0;
	best_y = 0;
	# for each asteroid at (x, y)
	for (x = 0; x < rows; ++x) {
		for (y = 0; y < cols; ++y) {
			if (a[y, x] != "#") continue;
			seen = 0;
			# check if asteroid at (row, col) can be seen
			for (row = 0; row < rows; ++row) {
				for (col = 0; col < cols; ++col) {
					if (a[row, col] != "#") continue
					if (x == col && y == row) continue; # ignore self
					# look for asteroids between (x, y) and (row, col)
					dx = (col - x);
					dy = (row - y);
					dd = max(abs(dx), abs(dy));
					visible = 1;
					for (d = 1; d < dd; ++d) {
						# look for any other asteroid at (px, py)
						px = x + (d / dd) * dx;
						py = y + (d / dd) * dy;
						if (px == int(px) && py == int(py) && a[py, px] == "#") {
							# asteroid found between (x, y) and (row, col)
							visible = 0;
							break;
						}
					}
					seen += visible;
				}
			}
			if (seen > best) {
				best = seen;
				best_x = x;
				best_y = y;
			}
		}
	}
	print(best, best_x, best_y);
}
