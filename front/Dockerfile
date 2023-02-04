FROM node:18.14.0-alpine3.16

WORKDIR /app

COPY package.json .

RUN apk update && \
    npm install

COPY . .