library(xml2)
library(stringr)
library(rlist)

z <- '
<CATALOG>
  <CD>
    <TITLE>Empire Burlesque</TITLE>
    <ARTIST>Bob Dylan</ARTIST>
    <COUNTRY>USA</COUNTRY>
    <COMPANY>Columbia</COMPANY>
    <PRICE>10.90</PRICE>
    <YEAR>1985</YEAR>
  </CD>
  <CD>
    <TITLE>Hide your heart</TITLE>
    <ARTIST>Bonnie Tylor</ARTIST>
    <COUNTRY>UK</COUNTRY>
    <COMPANY>CBS Records</COMPANY>
    <PRICE>9.90</PRICE>
    <YEAR>1988</YEAR>
  </CD>
</CATALOG>   
'

res <- rlist::list.parse(z, type='xml')
res

parse_xml_to_list <- function(xml_string) {
  xml_doc <- read_xml(xml_string)
  
  xml_to_list <- function(node) {
    
    if (xml_length(node) == 0) {
      return(xml_text(node))
    } 
    
    else {

      # If the node has children, create a list with the node's name as the key
      # and the children's list as the value
      
      children <- xml_children(node)
      list_result <- lapply(children, xml_to_list)
      return(setNames(list_result, xml_name(children)))
    }
  }
    
  result <- xml_to_list(xml_doc)
  
  return(result)
}

res2 <- parse_xml_to_list(z)

print(res2)

identical(res, res2)
