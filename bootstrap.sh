mkdir bundle

cd bundle

while read line        
do        
	git clone $line
done <plugins
