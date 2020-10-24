FROM jenkins/jenkins:latest

USER root

RUN apt-get update

RUN apt-get install systemd -y

RUN apt-get install -y python3-pip

RUN apt-get install python-dev -y

RUN apt-get install nginx -y

COPY jenkins.com.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/jenkins.com.conf /etc/nginx/sites-enabled/jenkins.com.conf

RUN nginx -t

RUN service nginx restart