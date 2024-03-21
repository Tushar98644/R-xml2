# Load the XML package
library(XML)

# Define the XML content as a character vector
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

# Parse the XML content
xml_doc <- xmlTreeParse(paste(xml_content, collapse = ''), useInternalNodes = TRUE)

# Print the parsed XML document
print(xml_doc)

# Get the root node of the XML document
movies_node <- xmlRoot(xml_doc)

# Print the name of the root node
cat("Root Node Name:", xmlName(movies_node), "\n")

# Get the attributes of the root node
root_attrs <- xmlAttrs(movies_node)

# Print the attributes of the root node
cat("Root Node Attributes:", "\n")
print(root_attrs)

# Get the children nodes of the root node
movie_nodes <- xmlChildren(movies_node)

# Iterate through each movie node
for (i in seq_along(movie_nodes)) {
  movie_node <- movie_nodes[[i]]
  
  # Print the name of the movie node
  cat("Movie Node", i, "Name:", xmlName(movie_node), "\n")
  
  # Get the attributes of the movie node
  movie_attrs <- xmlAttrs(movie_node)
  
  # Print the attributes of the movie node
  cat("Movie Node", i, "Attributes:", "\n")
  print(movie_attrs)
  
  # Get the children nodes of the movie node
  movie_children <- xmlChildren(movie_node)
  
  # Iterate through each child node of the movie node
  for (j in seq_along(movie_children)) {
    child_node <- movie_children[[j]]
    
    # Print the name of the child node
    cat("Child Node", j, "Name:", xmlName(child_node), "\n")
    
    # Print the content of the child node
    cat("Child Node", j, "Content:", xmlValue(child_node), "\n")
    
    # Get the attributes of the child node
    child_attrs <- xmlAttrs(child_node)
    
    # Print the attributes of the child node
    cat("Child Node", j, "Attributes:", "\n")
    print(child_attrs)
  }
  
  cat("\n")
}