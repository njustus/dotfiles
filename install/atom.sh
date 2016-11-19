#!/bin/sh

echo "installing atom packages"
#packages
apm install file-icons
apm install docblockr
apm install minimap
apm install project-manager

#language support
apm install language-latex
apm install language-scala

#themes
apm install tomorrow
apm install spectrum-light-syntax
apm install chester-atom-syntax
