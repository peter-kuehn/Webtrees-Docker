FROM nginx:1.29
RUN apt-get clean && apt-get update && apt-get install -y \
  spawn-fcgi \
  fcgiwrap \
  less vim \
  unzip \
  bash \
  certbot python3-certbot-nginx \
  && sed -i 's/www-data/nginx/g' /etc/init.d/fcgiwrap \
  && chown nginx:nginx /etc/init.d/fcgiwrap

COPY vhost.conf /etc/nginx/conf.d/default.conf
CMD /etc/init.d/fcgiwrap start \
    && nginx -g 'daemon off;'
