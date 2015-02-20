FROM ubuntu-upstart:14.04
MAINTAINER Hans Kramer
CMD ["/sbin/init"]
EXPOSE 80:80
RUN apt-get update 
ADD mediawiki-1.24.1.tar.gz /var/www/html
RUN ln -s /var/www/html/mediawiki-1.24.1 /var/www/html/wiki
RUN apt-get install -y mysql-server apache2 libapache2-mod-php5 php5-mysqlnd php5-xcache php5-intl
RUN /usr/sbin/mysqld 2>/dev/null &                                           \ 
while :; do echo "select 1" | mysql 2>&-; [ $? -eq 0 ] && break ; done;      \
echo 'CREATE DATABASE wiki;' | mysql;                                        \
echo 'CREATE USER "wiki"@"localhost" IDENTIFIED BY "__PASSWD__";' | mysql;   \
echo 'GRANT ALL PRIVILEGES ON wiki.* TO "wiki"@"%";' | mysql            
