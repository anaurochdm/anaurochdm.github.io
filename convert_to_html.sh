FILE=$1
FILENAME="${FILE%%.*}"

# Add needed header
cat << EOH >> ${FILENAME}.html
<html>

<head>
    <link rel="stylesheet" href="css/phb.standalone.css" />
</head>
<div class="phb">
EOH

# Convert the base markdown to HTML and add this to the file.
markdown ${FILE} >> ${FILENAME}.html

# Add the closing tags
cat << EOH >> ${FILENAME}.html
</div>

</html>
EOH
