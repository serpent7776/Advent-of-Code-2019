$1 == -1 && $2 == 0 {
	score = $3;
}
$3 == 3 {
	paddle_x = $1;
}
$3 == 4 {
	ball_x = $1;
	if (paddle_x < ball_x) {
		print 1
	} else if (paddle_x > ball_x) {
		print -1
	} else {
		print 0;
	}
}

END {
	print("score=", score);
}
