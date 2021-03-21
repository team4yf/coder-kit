FROM nginx:alpine
RUN apk add python3 python3-dev py3-pip build-base libressl-dev musl-dev libffi-dev && \
    pip3 install pip --upgrade && \
    pip3 install certbot-nginx && \
    mkdir /etc/letsencrypt
COPY ./default.conf /etc/nginx/conf.d/default.conf