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

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
