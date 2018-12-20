FROM debian:latest

MAINTAINER "Humberto López Menéndez" <shlopezm4@gmail.com>

RUN apt-get update

RUN sudo apt install curl

RUN curl https://www.mongodb.org/static/pgp/server-4.0.asc | sudo apt-key add -

RUN sudo nano /etc/apt/sources.list.d/mongodb-org-4.0.list

RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" > etc/apt/sources.list.d/mongodb-org-4.0.list

RUN sudo apt update

RUN sudo apt-get install mongodb-org

RUN sudo systemctl enable mongod

RUN sudo systemctl start mongod

EXPOSE 27017

CMD ["--port 27017"]

ENTRYPOINT usr/bin/mongod