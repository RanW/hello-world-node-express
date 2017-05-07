FROM node:boron

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

RUN apt-get -y update && \
    apt-get -y --no-install-recommends install nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Bundle app source
COPY . /usr/src/app

EXPOSE 3000
CMD ["npm", "start"]
