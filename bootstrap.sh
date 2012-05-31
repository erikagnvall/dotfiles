PLUGIN_FILE=plugins
BUNDLE_DIR=bundle

if [ ! -e "$PLUGIN_FILE" ]; then
	echo "No plugin file found. Exiting"
	exit 1
fi

if [ ! -d "$BUNDLE_DIR" ]; then
	mkdir $BUNDLE_DIR
fi

while read url
do
	name=`echo $url | cut -d '/' -f 5- | sed 's/\(.*\)..../\1/'`

	git clone $url $BUNDLE_DIR/$name
done < $PLUGIN_FILE
