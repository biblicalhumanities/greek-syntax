Greek Syntax is a Jupyter Notebook environment for querying the Greek New Testament using XQuery, XPath, or Python.

# Getting Started

Most users do not need to use the files in this repository.  Instead, they will use the docker image from Docker Hub.

- [Install Docker](https://docs.docker.com/install/)
- Run this command from the command line:
  `docker run -t -i biblicalhumanities/greek-syntax /bin/bash`
- **TODO**

Now you can learn how to use Greek Syntax using [this tutorial **TODO**]().

# Implementation

Greek Syntax is implemented as a Docker container based on [`jupyter/minimal-notebook`](https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook). It uses the marvelous [BaseX](basex.org) database for all XML processing and querying.

The data for these queries comes from these GitHub repos:

- https://github.com/biblicalhumanities/Nestle1904
- https://github.com/biblicalhumanities/greek-new-testament
- https://github.com/biblicalhumanities/levinsohn
- https://github.com/translatable-exegetical-tools/Abbott-Smith

# Directory Structure

- *docker* - Files we use to build the Docker container.
- *greeksyntax* - A Python module that we install in the Docker container.
