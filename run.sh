#! /bin/bash
#
#  \author   Hans Kramer
#  \date     Feb 2015
#

DID=$(docker run -d -p 80:80 -v $(pwd)/datastorage/var/lib/mysql:/var/lib/mysql \
                             -v $(pwd)/datastorage/var/www/html/wiki/images:/var/www/html/wiki/images wiki:latest)
[ "$1" = "-s" ] && docker exec -it $DID bash
