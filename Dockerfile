FROM ubuntu:12.04

RUN apt-get update && apt-get -y install php5-mysql php5-cli php5-mssql bzip2

ADD rpmsolutions.tar.bz2 /opt/www/vhosts/rpmsolutions/
ADD rpmsolutions_overwrites.tar.bz2 /opt/www/vhosts/rpmsolutions_overwrites/
ADD rpmadmin.tar.bz2 /opt/www/vhosts/rpmadmin/

RUN mkdir -p /opt/www/vhosts/rpmsolutions_sites/
RUN mkdir -p /opt/www/vhosts/rpmsolutions_sslsites/

WORKDIR /opt/www/vhosts/rpmadmin

RUN ./cake_run_dev clients refresh

WORKDIR /opt/www/vhosts

RUN tar cjvf rpmsolutions_after_clients_refresh.tar.bz2 rpmsolutions rpmsolutions_sites rpmsolutions_sslsites
