BASE=$(shell dirname "$(PWD)")

build:
	docker build -t nginx-certbot .
run:
	docker run -v $(BASE)/certs:/etc/letsencrypt --name nginx-certbot -ti -p 80:80 nginx-certbot sh
command:
	certbot --nginx -d hk.yunplus.io

