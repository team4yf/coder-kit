build-web:
	docker build -t yfsoftcom/coder-kit .

generate-ssl:
	docker run -it --rm \
		-v ./devops/ssl/certs:/etc/letsencrypt \
		-v ./devops/html:/var/lib/letsencrypt \
		certbot/certbot \
		certonly --webroot \
		--register-unsafely-without-email --agree-tos \
		--webroot-path=/data/letsencrypt \
		--staging \
		-d hk.yunplus.io