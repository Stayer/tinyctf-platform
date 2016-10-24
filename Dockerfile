FROM ubuntu:trusty
MAINTAINER Alexey Rodionov <rodionov12@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yqq update && \
    apt-get -yqq install gcc python3 python3-pip sqlite3

RUN pip3 install Flask dataset python-dateutil bleach
RUN exit

ADD web /var/www
WORKDIR /var/www

RUN chmod 755 *.sh
RUN ./buildTables.sh

EXPOSE 80

# start app
CMD [ "python3", "./server.py" ]
