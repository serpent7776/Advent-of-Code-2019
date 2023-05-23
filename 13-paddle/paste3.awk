BEGIN {
	while (getline a && getline b && getline c)
		print(a, b, c);
}
