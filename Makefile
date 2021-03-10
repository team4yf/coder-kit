BASE=$(shell dirname "$(PWD)")

build-web:
	docker build -t yfsoftcom/coder-kit .

ssl:
	docker run -it --rm \
	-v $(BASE)/devops/ssl/certs:/etc/letsencrypt \
	-v $(BASE)/devops/html:/var/lib/letsencrypt \
	certbot/certbot \
	certonly --webroot \
	--register-unsafely-without-email --agree-tos \
	--webroot-path=/data/letsencrypt \
	--staging \
	-d hk.yunplus.io