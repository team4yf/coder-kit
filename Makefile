BASE=$(shell dirname "$(PWD)")

build-web:
	docker build -t yfsoftcom/coder-kit .

ssl:
	docker run -it --rm \
	-v $(BASE)/devops/ssl/certs:/etc/letsencrypt \
	-v $(BASE)/devops/ssl/lib:/var/lib/letsencrypt \
	-v $(BASE)/devops/html:/data/letsencrypt \
	certbot/certbot \
	certonly --webroot \
	--register-unsafely-without-email --agree-tos \
	--webroot-path=/data/letsencrypt \
	--staging \
	-d hk.yunplus.io

cert:
	docker run --rm --name temp_certbot \
    -v $(BASE)/devops/ssl/certs:/etc/letsencrypt \
    -v $(BASE)/devops/html:/tmp/letsencrypt \
    -v $(BASE)/devops/ssl/log:/var/log \
    certbot/certbot:v1.8.0 \
    certonly --webroot --agree-tos --renew-by-default \
    --preferred-challenges http-01 --server https://acme-v02.api.letsencrypt.org/directory \
    --text --email yfsoftcom@126.com \
    -w /tmp/letsencrypt -d hk.yunplus.io

shell:
	docker run --rm --name temp_certbot -it \
    -v $(BASE)/devops/ssl/certs:/etc/letsencrypt \
    -v $(BASE)/devops/html:/tmp/letsencrypt \
    -v $(BASE)/devops/ssl/log:/var/log \
    certbot/certbot:v1.8.0 \
	sh