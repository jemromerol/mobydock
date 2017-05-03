FROM python:3.5-alpine
MAINTAINER Jose Emilio Romero <jemromerol@gmail.com>

RUN apk update && apk add build-base postgresql-dev libffi-dev postgresql-client

ENV INSTALL_PATH /mobydock
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

VOLUME ["static"]

CMD gunicorn -b 0.0.0.0:8000 "mobydock.app:create_app()"
