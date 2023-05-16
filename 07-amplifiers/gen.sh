echo 01234 | ruby -ne '$_.chomp.chars.to_a.permutation{|x| puts x.join " "}' | while read line; do
	read A B C D E << end
$line
end
	r0=0
	rA=`printf "$A\n$r0" | ./intcode-amp.sh`
	rB=`printf "$B\n$rA" | ./intcode-amp.sh`
	rC=`printf "$C\n$rB" | ./intcode-amp.sh`
	rD=`printf "$D\n$rC" | ./intcode-amp.sh`
	rE=`printf "$E\n$rD" | ./intcode-amp.sh`
	echo "$rE"
done
