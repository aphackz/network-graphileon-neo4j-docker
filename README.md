# graphileon-neo4j-docker

Builds docker image containing graphileon and neo4j
To use this project, you need to download the neo4j-community-3.2.6-unix.tar.gz file from the neo4j website
and place it in the root directory.  The version currently on the distribution site seems to be corrupted and
won't download properly with curl.

To start docker the first time use:
`docker run -t -d -p 8000:80 -p 7474:7474 -p 7473:7473 -p 7687:7687 --name interactor -v interator:/persistent graphileon`

Restart the docker image using:
`docker restart interactor`