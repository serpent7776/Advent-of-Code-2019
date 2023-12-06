BEGIN {
	SUBSEP=":"
}

{
	map[$NF][0] = $(NF-1)
	for (i = 1; i <= NF-2; i+=2) {
		map[$NF][$(i+1)] = $i
	}
}

function max(a, b) {
	return a > b ? a : b;
}

END {
	done = 0
	while (!done) {
		done = 1
		for (i in map["FUEL"]) {
			if (i == 0) continue
			if (i == "ORE") continue
			src = map["FUEL"][i]
			if (src <= 0) continue
			dst = map[i][0]
			ratio = max(1, int(src/dst))
			map["FUEL"][i] -= dst * ratio
			if (map["FUEL"][i] == 0) delete map["FUEL"][i]
			for (j in map[i]) {
				if (j == 0) continue
				map["FUEL"][j] += map[i][j] * ratio
				if (map["FUEL"][j] == 0) delete map["FUEL"][j]
			}
			done = 0
		}
	}
	print(map["FUEL"]["ORE"])
}
