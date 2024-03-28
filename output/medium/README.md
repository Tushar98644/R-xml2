Medium Test Analysis
================

## Introduction

This document demonstrates the analysis of XML data using R, focusing on
extracting information about movies from an XML string. The analysis
leverages the `XML` library in R to parse and manipulate XML data.

## Setting Up the Environment

## XML Data

The XML string contains information about two movies, including their
titles, directors, release years, and genres. The structure of the XML
string is hierarchical, with each movie enclosed within `<movie>` tags.

``` r
library(XML)
xml_content <- c(
    '<?xml version="1.0" encoding="UTF-8"?>',
    "<movies>",
    '<movie mins="126" lang="eng">',
    "<title>Good Will Hunting</title>",
    "<director>",
    "<first_name>Gus</first_name>",
    "<last_name>Van Sant</last_name>",
    "</director>",
    "<year>1998</year>",
    "<genre>drama</genre>",
    "</movie>",
    '<movie mins="106" lang="spa">',
    "<title>Y tu mama tambien</title>",
    "<director>",
    "<first_name>Alfonso</first_name>",
    "<last_name>Cuaron</last_name>",
    "</director>",
    "<year>2001</year>",
    "<genre>drama</genre>",
    "</movie>",
    "</movies>"
)
```

## Parsing XML Data

To analyze the XML data, we first need to parse it into an R object. The
`xmlTreeParse` function from the `XML` library is used for this purpose.
This function converts the XML string into an XML document object, which
can then be manipulated using R.

``` r
xml_doc <- xmlTreeParse(paste(xml_content, collapse = ""), useInternalNodes = TRUE)
print(xml_doc)
```

    ## <?xml version="1.0" encoding="UTF-8"?>
    ## <movies>
    ##   <movie mins="126" lang="eng">
    ##     <title>Good Will Hunting</title>
    ##     <director>
    ##       <first_name>Gus</first_name>
    ##       <last_name>Van Sant</last_name>
    ##     </director>
    ##     <year>1998</year>
    ##     <genre>drama</genre>
    ##   </movie>
    ##   <movie mins="106" lang="spa">
    ##     <title>Y tu mama tambien</title>
    ##     <director>
    ##       <first_name>Alfonso</first_name>
    ##       <last_name>Cuaron</last_name>
    ##     </director>
    ##     <year>2001</year>
    ##     <genre>drama</genre>
    ##   </movie>
    ## </movies>
    ## 

## Extracting Movie Information

To extract information about the movies, we use the `xmlRoot` function
to access the root node of the XML document. We then iterate over the
child nodes of the root node, which represent the movies, and extract
their information.

``` r
movies_node <- xmlRoot(xml_doc)

cat("Root Node Name:", xmlName(movies_node), "\n")
```

    ## Root Node Name: movies

``` r
root_attrs <- xmlAttrs(movies_node)

cat("Root Node Attributes:", "\n")
```

    ## Root Node Attributes:

``` r
print(root_attrs)
```

    ## NULL

``` r
movie_nodes <- xmlChildren(movies_node)
```

## Iterate through each Movie child node and display Information

``` r
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
```

    ## Movie Node 1 Name: movie 
    ## Movie Node 1 Attributes: 
    ##  mins  lang 
    ## "126" "eng" 
    ## Child Node 1 Name: title 
    ## Child Node 1 Content: Good Will Hunting 
    ## Child Node 1 Attributes: 
    ## NULL
    ## Child Node 2 Name: director 
    ## Child Node 2 Content: GusVan Sant 
    ## Child Node 2 Attributes: 
    ## NULL
    ## Child Node 3 Name: year 
    ## Child Node 3 Content: 1998 
    ## Child Node 3 Attributes: 
    ## NULL
    ## Child Node 4 Name: genre 
    ## Child Node 4 Content: drama 
    ## Child Node 4 Attributes: 
    ## NULL
    ## 
    ## Movie Node 2 Name: movie 
    ## Movie Node 2 Attributes: 
    ##  mins  lang 
    ## "106" "spa" 
    ## Child Node 1 Name: title 
    ## Child Node 1 Content: Y tu mama tambien 
    ## Child Node 1 Attributes: 
    ## NULL
    ## Child Node 2 Name: director 
    ## Child Node 2 Content: AlfonsoCuaron 
    ## Child Node 2 Attributes: 
    ## NULL
    ## Child Node 3 Name: year 
    ## Child Node 3 Content: 2001 
    ## Child Node 3 Attributes: 
    ## NULL
    ## Child Node 4 Name: genre 
    ## Child Node 4 Content: drama 
    ## Child Node 4 Attributes: 
    ## NULL
