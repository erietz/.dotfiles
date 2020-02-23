#!/usr/bin/env sh

# Stolen from Luke Smith's Github and adjusted to suit my needs

[ -z "$1" ] && echo "Give either a pdf file or a DOI as an argument." && exit

if [ -f "$1" ]; then
	# Try to get DOI from pdfinfo or pdftotext output.
	doi=$(pdfinfo "$1" | egrep -io "doi:.[^ ]*") ||
	doi=$(pdftotext "$1" 2>/dev/null - | egrep -io "doi:.[^ ]*" -m 1) ||
	exit 1
else
	doi="$1"
fi

# Check crossref.org for the bib citation.

site=$(echo "http://api.crossref.org/works/$doi/transform/application/x-bibtex" | 
	sed 's/\ //g')

curl -s $site -w "\\n"
