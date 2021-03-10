# install all the depends
FROM node:12.20.0-alpine3.9 AS builder

WORKDIR /app
COPY ./web/package.json ./
# delete cypress package
RUN npm config set registry https://registry.npmjs.org/ && \
    npm i --silent

# Web builder
# build the web html
FROM builder AS builder-web
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/node_modules /app/
# COPY ./public package.json src yarn.lock ./
COPY ./web ./
RUN npm run build

# nginx serve the static
FROM nginx:1.18.0-alpine

COPY --from=builder-web /app/build/ /usr/share/nginx/html/

