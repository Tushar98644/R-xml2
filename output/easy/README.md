Easy Test Analysis
================

## Introduction

This document demonstrates the analysis of XML data using R, focusing on
extracting information about movies from an XML string. The analysis
leverages the `xml2` and `stringr` libraries in R to parse and
manipulate XML data.

## Setting Up the Environment

## XML Data

The XML string contains information about two movies, including their
titles, directors, release years, and genres. The structure of the XML
string is hierarchical, with each movie enclosed within `<movie>` tags.

``` r
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
```

## Parsing XML Data

To analyze the XML data, we first need to parse it into an R object. The
`read_xml` function from the `xml2` library is used for this purpose.
This function converts the XML string into an XML document object, which
can then be manipulated using R.

``` r
doc <- read_xml(paste(xml_string, collapse = ''))
doc
```

    ## {xml_document}
    ## <movies>
    ## [1] <movie mins="126" lang="eng">\n  <title>Good Will Hunting</title>\n  <dir ...
    ## [2] <movie mins="106" lang="spa">\n  <title>Y tu mama tambien</title>\n  <dir ...

## Extracting Movie Information

To extract information about a specific movie, we use the `xml_child`
function to select the movie by its position in the XML document. We
then use the `xml_children` function to access the child nodes of the
movie, such as the title, director, year, and genre.

``` r
mama_tambien <- xml_child(doc, search = 2) 
mama_tambien
```

    ## {xml_node}
    ## <movie mins="106" lang="spa">
    ## [1] <title>Y tu mama tambien</title>
    ## [2] <director>\n  <first_name>Alfonso</first_name>\n  <last_name>Cuaron</last ...
    ## [3] <year>2001</year>
    ## [4] <genre>drama</genre>

``` r
xml_children(mama_tambien)
```

    ## {xml_nodeset (4)}
    ## [1] <title>Y tu mama tambien</title>
    ## [2] <director>\n  <first_name>Alfonso</first_name>\n  <last_name>Cuaron</last ...
    ## [3] <year>2001</year>
    ## [4] <genre>drama</genre>

## Displaying Results

The `xml_name` function is used to display the name of the XML node,
while the `xml_attrs` function shows the attributes of the node. This
provides a clear overview of the movie’s information.

``` r
xml_name(mama_tambien) 
```

    ## [1] "movie"

``` r
xml_attrs(mama_tambien)
```

    ##  mins  lang 
    ## "106" "spa"

## Extracting Director Information

To extract information about a specific movie, we use the `xml_child`
function to select the movie by its position in the XML document. We
then use the `xml_children` function to access the child nodes of the
movie, such as the title, director, year, and genre.

``` r
director <- xml_child(mama_tambien,"director")
director
```

    ## {xml_node}
    ## <director>
    ## [1] <first_name>Alfonso</first_name>
    ## [2] <last_name>Cuaron</last_name>

``` r
xml_text(director)
```

    ## [1] "AlfonsoCuaron"
