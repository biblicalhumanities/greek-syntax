Greek Syntax is a Jupyter Notebook environment for querying the Greek New Testament using XQuery, XPath, or Python.

# Getting Started

Most users do not need to use the files in this repository.  Instead, they will use the docker image from Docker Hub.

- [Install Docker](https://docs.docker.com/install/)
- Run this command from the command line:
  ```
  $ docker run -p 8888:8888 biblicalhumanities/greek-syntax
  ```
  If you get an error message saying that port 8888 is already in use on your computer, try `-p 8880:8888`, which maps to port 8880 instead. If that's already in use, try 8881, 8882, etc.

  When it runs, you will see a message with a URL to put in a web browser:

  ```
    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8888/?token=431d559093f580607f51cc1ed0dd3d86db0abc743c2d049e
  ```

  Follow the instructions - copy the URL and open it in a web browser. If you changed the port to 8080, change `localhost:8888` to `localhost:8880` in the URL before you open it.
- **TODO**

Now you can learn how to use Greek Syntax using [this tutorial **TODO**]().

# Implementation

Greek Syntax is implemented as a Docker container based on [`jupyter/minimal-notebook`](https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook). It uses the marvelous [BaseX](basex.org) database for all XML processing and querying.

The data for these queries comes from these GitHub repos:

- https://github.com/biblicalhumanities/Nestle1904
- https://github.com/biblicalhumanities/greek-new-testament
- https://github.com/biblicalhumanities/levinsohn
- https://github.com/translatable-exegetical-tools/Abbott-Smith

# Building a Docker image

To build a Docker image, use this script:

`build.sh`

# Directory Structure

- *docker* - Files we use to build the Docker container.
- *python* - Source code for the Python module that we install in the Docker container.
