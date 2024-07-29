FROM nginx:alpine

COPY ./docker/nginx/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/certs/server.crt /etc/nginx/certs/server.crt
COPY ./docker/nginx/certs/server.key /etc/nginx/certs/server.key

WORKDIR /var/www/html

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
