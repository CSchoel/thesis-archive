#!/bin/bash
# finds files that use the SBML level 3 package comp

find since2014 -name "*.xml" -exec egrep -l "level[0-9]/version[0-9]/comp" {} \;
# find since2014 -name "*.xml" -exec egrep "\bcomp\b" {} \;
# find since2014 -name "*.xml" -exec egrep -l "listOfSubmodels" {} \;
find since2014_autogen -name "*.xml" -exec egrep -l "level[0-9]/version[0-9]/comp" {} \;
