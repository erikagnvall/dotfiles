mkdir bundle

while read line        
do        
	git clone $line bundle/
done <plugins
	
