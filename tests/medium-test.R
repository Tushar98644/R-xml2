# Load the XML library
library(XML)

# Define the XML content as a vector
xml_content <- c(
  '<?xml version="1.0" encoding="UTF-8"?>',
  '<movies>',
  '<movie mins="126" lang="eng">',
  '<title>Good Will Hunting</title>',
  '<director>',
  '<first_name>Gus</first_name>',
  '<last_name>Van Sant</last_name>',
  '</director>',
  '<year>1998</year>',
  '<genre>drama</genre>',
  '</movie>',
  '<movie mins="106" lang="spa">',
  '<title>Y tu mama tambien</title>',
  '<director>',
  '<first_name>Alfonso</first_name>',
  '<last_name>Cuaron</last_name>',
  '</director>',
  '<year>2001</year>',
  '<genre>drama</genre>',
  '</movie>',
  '</movies>'
)

# Parse the XML content into an XML document
doc <- xmlTreeParse(paste(xml_content, collapse = ''), useInternalNodes = TRUE)

# Print the XML document
doc

# Check the class of the XML document
class(doc)

# Get the root node of the XML document
movies <- xmlRoot(doc)
movies

# Check the class of the root node
class(movies)

# Check if the XML document and the root node are identical
identical(doc, movies)

# Access the child nodes of the root node
xmlChildren(movies)

# Access the first movie node
good_will <- xmlChildren(movies)[[1]]
good_will

# Access the second movie node
tu_mama <- xmlChildren(movies)[[2]]
tu_mama

# Access the children nodes of 'good_will'
xmlChildren(good_will)

# Access the children nodes of 'tu_mama'
xmlChildren(tu_mama)

# Get the name of the 'good_will' node
xmlName(good_will)

# Get the attributes of the 'good_will' node
xmlAttrs(good_will)

# Get the size (number of children) of the 'good_will' node
xmlSize(good_will)

# Iterate over each child node of 'good_will' and print their names
children_nodes <- xmlChildren(good_will)
for (node in children_nodes) {
  print(xmlName(node))
}

# Access the first child node of 'good_will' (the title node)
title1 <- xmlChildren(good_will)[[1]]
title1

# Attempt to access the children nodes of 'title1' (which is a leaf node, so this will return NULL)
xmlChildren(title1)

# Get the text content of 'title1' (the title of the movie)
xmlValue(title1)

# Access the second child node of 'good_will' (the director node)
dir1 <- xmlChildren(good_will)[[2]]
dir1

# Access the children nodes of 'dir1' (the first and last name of the director)
xmlChildren(dir1)

# Get the text content of 'dir1'
xmlValue(dir1)