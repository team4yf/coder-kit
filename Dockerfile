# install all the depends
FROM node:12.20.0-alpine3.9 AS builder

WORKDIR /app
COPY ./web/package.json ./
RUN npm config set registry https://registry.npmjs.org/ && \
    npm i --silent

FROM builder AS builder-web
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/node_modules /app/
COPY ./web ./
RUN npm run build

# nginx serve the static
FROM nginx:1.18.0-alpine
RUN echo -e 'server {\n  listen       80;\n  location / {\n  root   /usr/share/nginx/html;\n  index  index.html index.htm;\n  try_files $uri $uri/ /index.html =404;\n  }\n}' > /etc/nginx/conf.d/default.conf
COPY --from=builder-web /app/build/ /usr/share/nginx/html/

