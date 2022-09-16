FROM jenkins/inbound-agent:latest-jdk11

LABEL MAINTAINER="DanielG <synec@users.noreply.github.com>"

USER root

RUN apt update

RUN apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common chromium rsync libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

RUN apt update

RUN apt install kubectl -y

RUN groupadd docker

RUN usermod -aG docker jenkins

ENV CHROME_BIN /usr/bin/chromium

USER jenkins
