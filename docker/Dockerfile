
FROM node:4.7.2
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app/package

ADD microservice-template-2.0.0.tgz /usr/src/app/

RUN npm install pm2 -g
RUN npm install

ENV PORT 3000

ENV NODE_ENV production
EXPOSE 3000

CMD pm2-docker server.js