FROM webdevops/bootstrap:ubuntu-16.04
MAINTAINER Hans Hoechtl "hhoechtl@1drop.de"

ENV POOTLE_VERSION="2.7.6"

RUN chmod -R 2777 /tmp

# Install apt packages
RUN /usr/local/bin/apt-install build-essential \
  swig \
  git \
  xmlstarlet \
  xsltproc \
  zip \
  cron \
  supervisor \
  unzip \
  mysql-client \
  openssh-client \
  python-dev \
  libxml2-dev \
  libssl-dev \
  libxslt1-dev \
  zlib1g-dev \
  libmysqlclient-dev \
  python-pip \
  python-xapian \
  xapian-tools \
  python-setuptools
# Install python packages
RUN pip install -q virtualenv \
    MySQL-python \
    flup \
    python-memcached \
    python-Levenshtein \
    m2crypto \
    wheel
# Install pootle
RUN pip install -I pootle==$POOTLE_VERSION
# Configure pootle
COPY pootle.conf /root/.pootle/pootle.conf
RUN mkdir -p /srv/pootle/po/.tmp
RUN ln -s /usr/lib/python2.7/dist-packages/xapian /usr/local/lib/python2.7/dist-packages/xapian
# RUN pootle setup
COPY pootle.sh /etc/profile.d/pootle.sh
RUN /etc/profile.d/pootle.sh
COPY scripts /home/pootle/scripts
COPY templates /home/pootle/templates
COPY frontend /usr/local/lib/python2.7/dist-packages/pootle/static
COPY typo3.cron /etc/cron.d/typo3
RUN cp -R /usr/lib/python2.7/dist-packages/xapian /usr/local/lib/python2.7/dist-packages/pootle/assets
RUN pootle collectstatic --noinput --clear
RUN pootle assets build

WORKDIR /home/pootle

EXPOSE 8080
VOLUME ["/usr/local/lib/python2.7/dist-packages/pootle"]
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
