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

cp -r ../python assets

docker build -t biblicalhumanities/greek-syntax .
