FROM nginx:alpine
RUN apk add gcc python3 python3-dev py3-pip build-base libressl-dev openssl-dev musl-dev cargo libffi-dev && \
    pip3 install pip --upgrade && \
    pip3 install certbot-nginx && \
    mkdir /etc/letsencrypt
COPY ./nginx.conf /etc/nginx/conf.d/default.conf