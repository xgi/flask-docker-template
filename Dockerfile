FROM ubuntu:16.04
MAINTAINER Anonymous <anon@example.com>

ENV DEBIAN_FRONTEND noninteractive

# install global dependencies
RUN apt-get update --fix-missing
RUN apt-get install -y build-essential git
RUN apt-get install -y python3 python3-dev python3-setuptools
RUN apt-get install -y python3-pip python-pip virtualenv
RUN apt-get install -y nginx supervisor
RUN pip install supervisor-stdout

# expose ports
EXPOSE 80

# create a virtual environment and install local dependencies
RUN virtualenv --python=/usr/bin/python3 /opt/venv
ADD ./requirements.txt /opt/venv/requirements.txt
RUN /opt/venv/bin/pip3 install -r /opt/venv/requirements.txt

# add config files
ADD ./conf/nginx.conf /etc/nginx/nginx.conf
ADD ./conf/supervisord.conf /etc/supervisord.conf

# add app
ADD proj /opt/proj

# start supervisor
CMD supervisord -c /etc/supervisord.conf -n
