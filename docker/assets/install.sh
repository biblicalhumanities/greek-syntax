# Build the directory structure for the gnt repo.
# See https://stackoverflow.com/questions/42735468/execute-command-on-host-during-docker-build?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

mkdir build
mkdir build/gnt
mkdir build/gnt/nestle1904
mkdir build/gnt/discourse
mkdir build/gnt/nestle1904lowfat
mkdir build/lexicon

# Expand and put in the target directory structure using XInclude

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
