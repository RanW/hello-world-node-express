FROM node:6-alpine

RUN mkdir -p /home/node/app \
    && apk add --no-cache tini
WORKDIR /home/node/app
COPY ["package.json","./"]
RUN npm install  \
    && [[ -d /tmp/npm-* ]] && rm -rf /tmp/npm-*
COPY . /home/node/app
ENTRYPOINT ["/sbin/tini", "--"]
EXPOSE 3000
CMD ["npm", "start"]
