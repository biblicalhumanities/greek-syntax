# Copyright (c) Jonathan Robie
# Distributed under the terms of the Modified BSD License.

# Start with Jupyter, add BaseX

FROM jupyter/minimal-notebook

LABEL maintainer="Jonathan Robie <jonathan.robie@biblicalhumanities.org>"

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update \
 && apt-get install -yq --no-install-recommends	apt-utils \
 && apt-get install -yq --no-install-recommends \
		basex \
		jing \
		libtagsoup-java \
		libxml-commons-resolver1.1-java \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash basex
RUN useradd -ms /bin/bash greeksyntax

# USER basex
# WORKDIR /home/basex
# RUN mkdir github \
#	&& cd github \
#	&& git clone https://github.com/biblicalhumanities/Nestle1904 \
#	&& git clone https://github.com/biblicalhumanities/greek-new-testament \
#	&& git clone https://github.com/biblicalhumanities/levinsohn \
#	&& git clone https://github.com/translatable-exegetical-tools/Abbott-Smith \
#	&& cd ..
# RUN basex -c "SET LANGUAGE el; CREATE DB nestle1904lowfat github/greek-new-testament/syntax-trees/nestle1904-lowfat/xml/nestle1904lowfat.xml"
# RUN basexserver

USER greeksyntax
WORKDIR /home/greeksyntax
