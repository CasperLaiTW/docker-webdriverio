FROM node:6

RUN npm install yarn -g

VOLUME /app
WORKDIR /app
RUN yarn install
