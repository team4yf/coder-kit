BASE=$(shell dirname "$(PWD)")

build:
	docker build -t nginx-certbot .
run:
	docker run -v $(BASE)/certs:/etc/letsencrypt --name nginx-certbot -ti -p 80:80 nginx-certbot sh
command:
	certbot --nginx -d hk.yunplus.io

single-command:
	sudo docker run -it --rm \
		-v $(BASE)/ssl/certs:/etc/letsencrypt \
		-v $(BASE)/html:/data/letsencrypt \
		certbot/certbot \
		certonly --webroot \
		--email yfsoftcom@126.com --agree-tos --no-eff-email \
		--webroot-path=/data/letsencrypt \
		-d fan.yunplus.io -d yunplus.io