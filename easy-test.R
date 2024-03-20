library(xml2)
library(stringr)

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
  '</movies>')

doc <- read_xml(paste(xml_string, collapse = ''))
doc

movies <- xml_root(doc)
movies

identical(doc, movies)

xml_length(doc)

xml_children(doc)

mama_tambien <- xml_child(doc, search = 2)
mama_tambien

xml_children(mama_tambien)
xml_name(mama_tambien)
xml_attrs(mama_tambien)

director <- xml_child(mama_tambien,"director")
director

xml_text(director)