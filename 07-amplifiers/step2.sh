A="$1"
B="$2"
C="$3"
D="$4"
E="$5"

rm -f p[ABCDEX]

mkfifo pA pB pC pD pE pX

r0=0

cat < pX >> pA &
./intcode-amp.sh < pE | tee E >> pX &
./intcode-amp.sh < pD | tee D >> pE &
./intcode-amp.sh < pC | tee C >> pD &
./intcode-amp.sh < pB | tee B >> pC &
./intcode-amp.sh < pA | tee A >> pB &

echo "$A" >> pA
echo "$B" >> pB
echo "$C" >> pC
echo "$D" >> pD
echo "$E" >> pE
echo "$r0" >> pA

wait
tail -1 E
