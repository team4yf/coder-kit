BASE=$(shell dirname "$(PWD)")

build-web:
	docker build -t yfsoftcom/coder-kit .

ssl:
	sudo docker run -it --rm \
		-v $(BASE)/devops/ssl/certs:/etc/letsencrypt \
		-v $(BASE)/devops/ssl/html:/data/letsencrypt \
		certbot/certbot \
		certonly --webroot \
		--email yfsoftcom@126.com --agree-tos --no-eff-email \
		--webroot-path=/data/letsencrypt \
		-d fan.yunplus.io

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