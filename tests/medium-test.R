library(XML)

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

xml_doc <- xmlTreeParse(paste(xml_content, collapse = ''), useInternalNodes = TRUE)

print(xml_doc)

movies_node <- xmlRoot(xml_doc)

cat("Root Node Name:", xmlName(movies_node), "\n")

root_attrs <- xmlAttrs(movies_node)

cat("Root Node Attributes:", "\n")
print(root_attrs)

movie_nodes <- xmlChildren(movies_node)

for (i in seq_along(movie_nodes)) {
  movie_node <- movie_nodes[[i]]
  
  cat("Movie Node", i, "Name:", xmlName(movie_node), "\n")
  
  movie_attrs <- xmlAttrs(movie_node)
  
  cat("Movie Node", i, "Attributes:", "\n")
  print(movie_attrs)
  
  movie_children <- xmlChildren(movie_node)
  
  for (j in seq_along(movie_children)) {
    child_node <- movie_children[[j]]
    
    cat("Child Node", j, "Name:", xmlName(child_node), "\n")
    
    cat("Child Node", j, "Content:", xmlValue(child_node), "\n")
    
    child_attrs <- xmlAttrs(child_node)
    
    cat("Child Node", j, "Attributes:", "\n")
    print(child_attrs)
  }
  
  cat("\n")
}