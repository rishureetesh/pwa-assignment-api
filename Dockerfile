FROM python:3.7-alpine
MAINTAINER Reetesh Kumar
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --no-cache --virtual .build-deps gcc musl-dev libffi-dev openssl-dev && pip install -r /requirements.txt  && apk del .build-deps gcc musl-dev

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user