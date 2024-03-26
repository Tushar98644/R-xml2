# Load required libraries
library(xml2)
library(stringr)

# Define the XML string
xml_string <- c(
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

# Read the XML string into an XML document
doc <- read_xml(paste(xml_string, collapse = ''))

# Print the XML document
doc

# Extract the second movie node from the XML document
mama_tambien <- xml_child(doc, search = 2)
mama_tambien

# List all child nodes of the second movie node
xml_children(mama_tambien)

# Extract the director node from the second movie node
director <- xml_child(mama_tambien, "director")
director

# Extract the contents of the director node
xml_contents(director)

# Extract the text content of the director node
xml_text(director)