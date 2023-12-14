BEGIN {
	SUBSEP=":"
	WALL="#"; FLOOR="."; SRC="X";
}

{
	map[$1, $2] = $3
	if ($3 == SRC) {
		sx = $1
		sy = $2
	}
}

function max(a, b) {
	return a > b ? a : b;
}

function bfs2(    idx, n, xy, xys, x, y, dist) {
	idx = 0
	xys[idx++] = sx SUBSEP sy
	map[sx, sy] = 0
	maxdist = 0
	while (length(xys) > 0)
		for (n in xys)
		{
			xy = xys[n]
			split(xy, p, SUBSEP)
			x=p[1]; y=p[2];
			delete xys[n]
			dist = map[x, y]
			if ((x+1, y) in map && map[x+1, y] == FLOOR) {
				 xys[idx++] = (x+1) SUBSEP y
				 map[x+1, y] = dist+1
				 maxdist = max(maxdist, dist+1)
			}
			if ((x-1, y) in map && map[x-1, y] == FLOOR) {
				 xys[idx++] = (x-1) SUBSEP y
				 map[x-1, y] = dist+1
				 maxdist = max(maxdist, dist+1)
			}
			if ((x, y+1) in map && map[x, y+1] == FLOOR) {
				 xys[idx++] = x SUBSEP (y+1)
				 map[x, y+1] = dist+1
				 maxdist = max(maxdist, dist+1)
			}
			if ((x, y-1) in map && map[x, y-1] == FLOOR) {
				 xys[idx++] = x SUBSEP (y-1)
				 map[x, y-1] = dist+1
				 maxdist = max(maxdist, dist+1)
			}
			break
		}
	print("\033[30E"maxdist)
}

END {
	bfs2()
}
