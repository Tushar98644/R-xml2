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

good_will <- xml_child(doc,search = 1)
good_will

xml_name(good_will)
title1 <- xml_child(good_will,"title")
director1 <- xml_child(good_will,"director")
year1 <- xml_child(good_will,"year")
genre1 <- xml_child(good_will,"genre")


mama_tambien <- xml_child(doc, search = 2)
mama_tambien

xml_name(mama_tambien)
title2 <- xml_child(mama_tambien,"title")
director2 <- xml_child(mama_tambien,"director")
year2 <- xml_child(mama_tambien,"year")
genre2 <- xml_child(mama_tambien,"genre")

# Define the information for the first movie
title1_text <- xml_text(title1)
director1_first <- xml_text(xml_child(director1, "first_name"))
director1_last <- xml_text(xml_child(director1, "last_name"))
year1_text <- xml_text(year1)
genre1_text <- xml_text(genre1)

# Define the information for the second movie
title2_text <- xml_text(title2)
director2_first <- xml_text(xml_child(director2, "first_name"))
director2_last <- xml_text(xml_child(director2, "last_name"))
year2_text <- xml_text(year2)
genre2_text <- xml_text(genre2)

# Create the paragraphs
paragraph1 <- paste("The first movie is", title1_text, "directed by", director1_first, director1_last,
                    "released in", year1_text, "and falls under the genre of", genre1_text, ".")
paragraph2 <- paste("The second movie is", title2_text, "directed by", director2_first, director2_last,
                    "released in", year2_text, "and falls under the genre of", genre2_text, ".")

# Print the paragraphs
print(paragraph1)
print(paragraph2)