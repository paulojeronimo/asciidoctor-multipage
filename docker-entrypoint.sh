#!/bin/sh
# A dynamic way to discover wich version of asciidoctor is installed:
#asciidoctor_version=$(
#  gem list |
#  sed -n '/^asciidoctor .*/p' |
#  sed 's/^asciidoctor (\(.*\))$/\1/g')

# A static way (better performance):
#echo -n "asciidoctor-multipage is running with asciidoctor "
#cat /asciidoctor.version

asciidoctor -r /root/asciidoctor-multipage.rb -b multipage_html5 "$@"
