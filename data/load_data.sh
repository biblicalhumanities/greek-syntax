#!/bin/bash
if [ -e github ]; then
	echo "Using existing local repositories"
else
	mkdir github
	pushd github
	git clone https://github.com/biblicalhumanities/Nestle1904
	git clone https://github.com/biblicalhumanities/greek-new-testament
	git clone https://github.com/biblicalhumanities/levinsohn
	git clone https://github.com/translatable-exegetical-tools/Abbott-Smith
	popd
fi

# Build the directory structure for the gnt repo.

if [ -e github ]; then
	echo "Using existing build directory"
else
	mkdir build
	mkdir build/gnt
	mkdir build/gnt/nestle1904
	mkdir build/gnt/discourse
	mkdir build/gnt/nestle1904lowfat
	mkdir build/lexicon
fi

# Expand and put in the gnt directory structure using XInclude

basex -i 'github/greek-new-testament/syntax-trees/nestle1904-lowfat/xml/nestle1904lowfat.xml' '/' >build/gnt/nestle1904lowfat/nestle1904lowfat.xml
basex -i 'github/Nestle1904/xml/nestle1904.xml' '/' >build/gnt/nestle1904/nestle1904.xml
basex -i 'github/levinsohn/LGNTDF/levinsohn.xml' '/' >build/gnt/discourse/levinsohn.xml

# Copy the lexicon

cp github/Abbott-Smith/abbott-smith.tei_lemma.xml build/lexicon/abbott-smith.xml

# Create the databases

basex -c "SET LANGUAGE el; CREATE DB greek-syntax build"
basex -c "SET LANGUAGE el; CREATE DB nestle1904lowfat github/greek-new-testament/syntax-trees/nestle1904-lowfat/xml/nestle1904lowfat.xml"
basex -c "SET LANGUAGE el; CREATE DB nestle1904 github/Nestle1904/xml/nestle1904.xml"
basex -c "SET LANGUAGE el; CREATE DB levinsohn github/levinsohn/LGNTDF/levinsohn.xml"
basex -c "SET LANGUAGE el; CREATE DB abbott-smith build/lexicon/abbott-smith.xml"
