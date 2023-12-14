BEGIN {
	SUBSEP=":"
	WALL="#"; FLOOR="."; SRC="@"; DST="X"
}

{
	map[$1, $2] = $3
	if ($3 == SRC) {
		sx = $1
		sy = $2
	} else if ($3 == DST) {
		tx = $1
		ty = $2
	}
}

function bfs(    idx, n, xy, xys, x, y, dist) {
	idx = 0
	xys[idx++] = sx SUBSEP sy
	map[sx, sy] = 0
	map[tx, ty] = FLOOR
	while (length(xys) > 0)
		for (n in xys)
		{
			xy = xys[n]
			split(xy, p, SUBSEP)
			x=p[1]; y=p[2];
			delete xys[n]
			dist = map[x, y]
			if (x == tx && y == ty) {
				print("\033[30E"dist)
				exit
			}
			if ((x+1, y) in map && map[x+1, y] == FLOOR) {
				 xys[idx++] = (x+1) SUBSEP y
				 map[x+1, y] = dist+1
			}
			if ((x-1, y) in map && map[x-1, y] == FLOOR) {
				 xys[idx++] = (x-1) SUBSEP y
				 map[x-1, y] = dist+1
			}
			if ((x, y+1) in map && map[x, y+1] == FLOOR) {
				 xys[idx++] = x SUBSEP (y+1)
				 map[x, y+1] = dist+1
			}
			if ((x, y-1) in map && map[x, y-1] == FLOOR) {
				 xys[idx++] = x SUBSEP (y-1)
				 map[x, y-1] = dist+1
			}
			break
		}
}

END {
	bfs()
}
