############################################################
# Dockerfile to build a node.js v. 6 development
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM node:6

# File Author / Maintainer
MAINTAINER thajo

# Should run commands as non root if going to production!!!

# Since we want to use the cache when building new containers
# Trick taken from: http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
ADD app/package.json /tmp/package.json
RUN cd /tmp && npm install
# create an app folder
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/
VOLUME /opt/app/node_modules


# copy the the
#COPY app/ /opt/app/.

#WORKDIR /opt/app/

EXPOSE 8080
