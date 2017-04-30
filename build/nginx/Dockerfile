FROM alpine:3.3
MAINTAINER David Losada Carballo "davidlosada@ushahidi.com"

RUN apk add --update nginx && \
    rm -rf /var/cache/apk/*

ARG BUILD_TAG

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/site.conf /etc/nginx/conf.d/site.conf
COPY nginx/fastcgi_params.conf /etc/nginx/fastcgi_params.conf
COPY nginx/start.sh /root

COPY tars/ushahidi-platform-client-bundle-${BUILD_TAG}.tar.gz /tmp

RUN cd /tmp && \
    tar xfz ushahidi-platform-client-bundle-${BUILD_TAG}.tar.gz && \
    mkdir -p /var/app/server/www && \
    mv ushahidi-platform-client-bundle-${BUILD_TAG}/* /var/app/server/www

RUN mkdir -p /tmp/nginx/body /tmp/nginx/fcgi && \
    chown nginx:nginx /tmp/nginx

EXPOSE 80

CMD ["/bin/sh", "/root/start.sh"]
