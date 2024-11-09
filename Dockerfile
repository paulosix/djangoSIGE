FROM alpine:3.18.9
MAINTAINER paulosix@hotmail.com
RUN mkdir -p /opt/djangoSIGE/
WORKDIR /opt/djangoSIGE/
COPY . /opt/djangoSIGE/
RUN apk update
RUN apk add --no-cache python3 python3-dev \
    py3-cffi zlib-dev gcc jpeg-dev \
    linux-headers libressl-dev \
    libxml2-dev libxslt-dev \
    musl-dev postgresql-dev \
    && apk add py3-pip \
    && pip3 install --upgrade pip --ignore-installed six \
    && pip3 install -r requirements.txt \
    && pip3 install gunicorn psycopg2 \