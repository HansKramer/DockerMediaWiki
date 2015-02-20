# DockerMediaWiki

== Build ==

$ ./build.sh
$ ./run.sh -s

Then point chrome to the wiki and configure it. Download the LocalSettings.php.
In the container scp this file from your desktop to /var/www/html/wiki and change permissions

root@32743efbd39b:/# scp user@your-ip:Downloads/LocalSettings.php /var/www/html/wiki
root@32743efbd39b:/# chmod a+r /var/www/html/wiki/LocalSettings.php
root@32743efbd39b:/# exit

Commit the container

$ docker ps
$ docker commit container-id wiki:latest

