BASE=$(shell pwd)

build-web:
	docker build -t yfsoftcom/coder-kit .

ssl:
	docker run -it --rm \
		-v $(BASE)/devops/ssl/certs:/etc/letsencrypt \
		-v $(BASE)/devops/ssl/html:/data/letsencrypt \
		certbot/certbot \
		certonly --webroot \
		--email yfsoftcom@126.com --agree-tos --no-eff-email \
		--webroot-path=/data/letsencrypt \
		-d fan.yunplus.io

run:
	docker-compose up -d

reload-nginx:
	docker exec proxy nginx -s reload