FILE=$1
FILENAME="${FILE%%.*}"


# For some reason, markdown doesn't overwrite automatically, so remove the file if it exists.
if [ -f "${FILENAME}.html" ]; then
	rm ${FILENAME}.html
fi

# Add needed header
cat << EOH >> ${FILENAME}.html
<html>

<head>
    <link rel="stylesheet" href="css/phb.standalone.css" />
</head>
<div class="phb" id="p1">
EOH

# Convert the base markdown to HTML and add this to the file.
markdown ${FILE} >> ${FILENAME}.html

# Add the closing tags
cat << EOH >> ${FILENAME}.html
</div>

</html>
EOH

# Replace the page tag with appropriate HTML
sed -i 's/<p>\\page<\/p>/<div class="phb" id="p2">/g' ${FILENAME}.html
