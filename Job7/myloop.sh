i=1

while [ $i -lt 11 ]
do
	echo "Je suis un script qui arrive à faire une boucle $i"
	i=`expr $i + 1`
done
