server {
  listen   80;
  server_name   fan.yunplus.io;

  location ~ /.well-known/acme-challenge/ {
    allow all;
    root /usr/share/nginx/html;
  }

  # root /usr/share/nginx/html;
  # index index.html;

  # location = /.well-known/acme-challenge/ {
  #     return 404;
  # }
}