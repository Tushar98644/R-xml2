# GSoC Project Task: Supporting Migration from XML Package

Welcome to the R-xml2 repository! This repository contains tests and examples for working with XML content using the xml2 package in R. Below you'll find information on how to navigate this repository and run the provided tests. This project aims to contribute to the migration efforts from the XML package to the xml2 package in R.

## Table of Contents

- [Introduction](#introduction)
- [Tests Overview](#tests-overview)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The XML package in R has been in maintenance mode for several years, and there's a push to migrate packages depending on XML to alternatives such as xml2, which is actively developed. This project aims to support this migration effort by contributing patches to packages dependent on XML, implementing the switch to xml2, and documenting example mappings from XML to xml2 code.

## Tests Overview

This repository contains three tests:

`Easy Test`: This test demonstrates basic XML parsing using the xml2 package. It involves extracting specific information from a simple XML document.

`Medium Test`: The medium test builds upon the concepts covered in the easy test and introduces more advanced XML parsing techniques. It involves replicating a given analysis using functions from the XML package.

`Hard Test`: The hard test is the most challenging and requires advanced XML parsing skills. It involves writing a custom function to parse XML code without depending on the XML package.

Each test is designed to progressively increase in difficulty, providing users with a comprehensive learning experience.

# Installation

Before running the tests or contributing to this project, ensure that you have the following packages installed:

1. xml2
2. XML
3. stringr

You can install these packages using the following R commands:

```
install.packages("xml2")
install.packages("XML")
install.packages("stringr")
```

# Usage

To run the tests for this project, follow these steps:

1. Clone this repository to your local machine.
2. Open RStudio or any other R environment.
3. Load the required packages:

```
library(xml2)
library(XML)
library(stringr)
```

5. Navigate to the directory where the repository is cloned.
6. Run the desired test script (easy-test.R, medium-test.R, or hard-test.R) to execute the corresponding test.
7. Run the script in your R environment.

# Contributing

Contributions to this repository are welcome! If you have ideas for additional tests, improvements to existing tests, or any other enhancements, feel free to open an issue or submit a pull request.

Before contributing, please review the contribution guidelines.

# License


This project is licensed under the [GPL-3.0 Public License](LICENSE).
