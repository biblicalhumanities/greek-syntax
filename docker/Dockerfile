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
                libjline2-java \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Python package

ADD assets assets
RUN cd assets/python && python setup.py install && cd ../..

# Install startup script

COPY assets/start-greeksyntax.sh /usr/local/bin
CMD ["start-greeksyntax.sh"]

# Switch to jovyan and build database
USER $NB_UID
ADD github github
RUN assets/install.sh

# Delete files that we don't need any more
USER root
RUN rm -rf github
RUN rm -rf assets
RUN rm -rf build

# And leave joyvan as the user at the end
USER $NB_UID
