mkdir bundle

while read line        
do        
	`git clone $line`
done <plugins
	
