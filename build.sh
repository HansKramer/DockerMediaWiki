#! /bin/bash
#
#  \author   Hans Kramer
#  \date     Feb 2015
#

read -s -p "Password: " PASSWD
sed -i.backup 's/__PASSWD__/'"$PASSWD"'/' Dockerfile
docker build -t wiki .
mv -f Dockerfile.backup Dockerfile
