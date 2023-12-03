function gcd(a, b,     t) {
    while (b != 0) {
        t = b;
        b = a % b;
        a = t;
    }
    return a;
}

function lcm(x, y) {
    return (x * y) / (gcd(x, y));
}

function lcm3(x, y, z) {
	return lcm(lcm(x, y), z)
}

{
	print(lcm3($1, $2, $3))
}
