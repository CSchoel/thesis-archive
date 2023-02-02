#!/bin/bash

# finds models using the <import> tag
find data -name "*.cellml" -exec egrep -l '<\s*import[^>]*>' {} \; | egrep -o "^data/[^/]+" | uniq

# finds cellml 1.0 models (575)
# find data -name "*.cellml" -exec grep -l 'http://www.cellml.org/cellml/1.0#' {} \; | egrep -o "^data/[^/]+" | uniq
# find data -name "*.cellml" -exec grep -l 'http://www.cellml.org/cellml/2.0#' {} \; | egrep -o "^data/[^/]+" | uniq