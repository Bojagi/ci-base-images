FROM node:8

### DOCKER ###
ENV  DOCKER_VERSION="17.12.0~ce-0~debian"
# ENV  COMPOSE_VERSION="1.13.0"

RUN apt-get update && \
    apt-get install -y\
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
    add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) \
     stable"
RUN apt-get update && apt-get install -y \
	docker-ce=${DOCKER_VERSION}

# 
# RUN curl -L -o /tmp/docker-$DOCKER_VERSION.tgz https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz && \
#   tar -xz -C /tmp -f /tmp/docker-$DOCKER_VERSION.tgz && \
#   mv /tmp/docker/* /usr/bin

# RUN curl -L https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
#   chmod +x /usr/local/bin/docker-compose
  
  
# lerna
# gcloud
