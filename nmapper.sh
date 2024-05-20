i=1
ii=1
iii=1
iv=1

while [ $i -lt 256 ];
do
	ii=1
	while [ $ii -lt 256 ];
	do
		iii=1
		while [ $iii -lt 256 ];
		do
			iv=1
			while [ $iv -lt 256 ];
			do
				nmap $i.$ii.$iii.$iv
				iv=$((iv + 1))
			done
			iii=$((iii + 1))
		done
		ii=$((ii + 1))
	done
	i=$((i + 1))
done
