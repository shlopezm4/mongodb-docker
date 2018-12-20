FROM debian:latest

MAINTAINER "Humberto López Menéndez" <shlopezm4@gmail.com>

RUN apt-get update

RUN apt-get install -y curl

RUN apt-get install -y gnupg

RUN curl https://www.mongodb.org/static/pgp/server-4.0.asc | sudo apt-key add -

RUN touch /etc/apt/sources.list.d/mongodb-org-4.0.list

RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

RUN apt-get update

RUN apt-get install -y mongodb-org

CMD service mongod enable

CMD service mongod start

EXPOSE 27017

CMD ["--port 27017"]

ENTRYPOINT usr/bin/mongod