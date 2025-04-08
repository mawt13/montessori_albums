#!/bin/bash

TMP_DIR="/tmp"
WEB_SERVER="mawt@10.0.0.3"

cd ~/dev/montessori_albums/

# remove docker image based on name of project
docker rmi $(docker images 'mawt/montessori_albums:latest' -a -q)

# build docker image
docker build -t mawt/montessori_albums . --platform="linux/arm64"

# save docker image to tar file
docker save -o $TMP_DIR/montessori_albums.tar mawt/montessori_albums:latest

# copy tar file to server
scp $TMP_DIR/montessori_albums.tar $WEB_SERVER:/ram/

### server cmds
echo 'Executing server cmds...'
# cd ~/docker/montessori_albums/
ssh $WEB_SERVER 'cd docker/montessori_albums; docker-compose down'
ssh $WEB_SERVER 'docker rmi $(docker images "mawt/montessori_albums:latest" -a -q)'
ssh $WEB_SERVER 'docker load -i /ram/montessori_albums.tar'
ssh $WEB_SERVER 'cd docker/montessori_albums; docker-compose up -d'
ssh $WEB_SERVER 'rm /ram/montessori_albums.tar'

### finished server cmd
echo 'Finished server cmds...'

# remove temp files
rm $TMP_DIR/montessori_albums.tar
echo 'done'
