FROM ubuntu:16.04
MAINTAINER Hans Hoechtl "hhoechtl@1drop.de"

ENV POOTLE_SETTINGS /etc/pootle.conf

WORKDIR /var/www/pootle/

VOLUME ["/var/pootledb"]

RUN mkdir -p /var/www/pootle/
RUN apt-get -qq update
RUN apt-get install -y build-essential zlib1g-dev libxml2-dev libxslt-dev python-dev python-pip curl wget git libmysqlclient-dev
RUN pip install virtualenv
RUN virtualenv env
RUN . env/bin/activate
RUN pip install --upgrade pip
RUN pip install MySQL-python

RUN pip install Pootle
RUN pootle init

COPY pootle.conf /etc/pootle.conf
COPY run.sh run.sh

EXPOSE 8000

CMD /bin/bash ./run.sh
