#! /bin/bash
#
#  \author   Hans Kramer
#  \date     Feb 2015
#

read -s -p "Password: " PASSWD
sed -i.backup 's/__PASSWD__/'"$PASSWD"'/' Dockerfile
docker build -t wiki .
mv -f Dockerfile.backup Dockerfile
rm -rf ./datastorage
mkdir -p ./datastorage/var/lib/mysql
DID=$(docker run -d -v $(pwd)/datastorage/var/lib/mysql:/mnt wiki:latest)
docker exec $DID stop mysql
docker exec $DID mv /var/lib/mysql/* /mnt 
docker commit $DID wiki
docker stop $DID
