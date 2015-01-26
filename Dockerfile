# sshd
#
# VERSION               0.0.1

FROM     gendosu/ubuntu-ssh:latest
MAINTAINER Gen Takahashi "gendosu@gmail.com"

RUN apt-get update

RUN apt-get install -y curl git libssl-dev libreadline-dev imagemagick libmagick++-dev libqtwebkit-dev xvfb libffi-dev mysql-client libmysqlclient-dev

RUN apt-get -y install nginx php5 php5-cli php5-fpm

ADD supervisord/nginx.conf /etc/supervisor/conf.d/nginx.conf
ADD supervisord/php5-fpm.conf /etc/supervisor/conf.d/php5-fpm.conf

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]
