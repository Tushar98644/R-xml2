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
xml_doc <- xmlTreeParse(paste(xml_content, collapse = ''), useInternalNodes = TRUE)

# Print the XML document
xml_doc

# Check the class of the XML document
class(xml_doc)

# Get the size of the XML document
xmlSize(xml_doc)

# Get the root node of the XML document
movies_node <- xmlRoot(xml_doc)
movies_node

# Check the class of the root node
class(movies_node)

# Get the size of the root node
xmlSize(movies_node)

# Check if the XML document and the root node are identical
identical(xml_doc, movies_node)

# Print the name of the root node
cat("Root Node Name:", xmlName(movies_node), "\n")

# Get the attributes of the root node
root_attrs <- xmlAttrs(movies_node)

cat("Root Node Attributes:","\n")
print(root_attrs)

# Get the child nodes of the root node
movie_nodes <- xmlChildren(movies_node)
print(movie_nodes)

# Iterate over each movie node
for (i in seq_along(movie_nodes)) {
  
  movie_node <- movie_nodes[[i]]
  
  cat("Movie Node", i, "Name:", xmlName(movie_node), "\n")
  
  # Get the attributes of the movie node
  movie_attrs <- xmlAttrs(movie_node)
  
  cat("Movie Node", i, "Attributes:", "\n")
  print(movie_attrs)
  
  # Get the size of the movie node
  movie_node_length <- xmlSize(movie_node)
  
  cat("Movie Node", i, "Length:", "\n")
  print(movie_node_length)
  
  # Get the child nodes of the movie node
  movie_node_children <- xmlChildren(movie_node)
  
  cat("Movie Node", i, "Children:", "\n")
  print(movie_node_children)
  
  # Iterate over each child node of the movie node
  movie_children <- xmlChildren(movie_node)
  
  for (j in seq_along(movie_children)) {
    child_node <- movie_children[[j]]
    
    cat("Child Node", j, "Name:", xmlName(child_node), "\n")
    
    # Get the text content of the child node
    cat("Child Node", j, "Content:", xmlValue(child_node), "\n")
    
    # Get the attributes of the child node
    child_attrs <- xmlAttrs(child_node)
    
    cat("Child Node", j, "Attributes:", "\n")
    print(child_attrs)
    
    # Get the size of the child node
    child_length <- xmlSize(child_node)
    
    cat("Child Node", j, "Length:", "\n")
    print(child_length)
    
    # Get the child nodes of the child node
    child_children <- xmlChildren(child_node)
    
    cat("Child Node", j, "Children:", "\n")
    print(child_children)
    
  }
  
  cat("\n")
}