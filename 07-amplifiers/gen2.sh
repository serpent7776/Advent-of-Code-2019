echo 56789 | ruby -ne '$_.chomp.chars.to_a.permutation{|x| puts x.join " "}' | while read line; do
	read A B C D E << end
$line
end
	./step2.sh $A $B $C $D $E
done | sort -n | tail -1
