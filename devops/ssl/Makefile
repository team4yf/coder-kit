BASE=$(shell dirname "$(PWD)")

build:
	docker build -t yfsoftcom/nginx-letsencrypt .

push:
	docker push yfsoftcom/nginx-letsencrypt

init-folder:
	sudo mkdir html
	sudo mkdir certs
	sudo chmod 777 -R html
	sudo chmod 777 -R certs

run-web:
	docker run --rm \
		-p 80:80 \
		-e domain=$(domain) \
		-v $(BASE)/html:/usr/share/nginx/html \
		-d \
		yfsoftcom/nginx-letsencrypt


issue:
	docker run -it --rm \
		-v $(BASE)/certs:/etc/letsencrypt \
		-v $(BASE)/html:/data/letsencrypt \
		certbot/certbot \
		certonly --webroot \
		--email $(email) --agree-tos --no-eff-email \
		--webroot-path=/data/letsencrypt \
		-d $(domain)