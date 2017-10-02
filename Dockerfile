############################################################
# Dockerfile to build a node.js development
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM node

# File Author / Maintainer
LABEL "com.example.vendor"="LNU"
LABEL version="1.0"
LABEL maintainer="thajo@lnu.se"


# Since it is just dev we create this with std user
RUN mkdir -p /opt/app

# Start with a WORKDIR
WORKDIR /opt/app

# First take the package.json and install all the modules
COPY package.json .
RUN npm install --quiet

# Mount this VOLUME to avoid writting over the node_moules when we
# mount the local directory in the command
VOLUME /opt/app/node_modules

# Copy the app
COPY . .

EXPOSE 8080
