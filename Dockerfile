FROM alpine:3.11
LABEL author "Serge NOEL <serge.noel@easylinux.fr>"

RUN apk add --no-cache redis \
    && sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/g" /etc/redis.conf \
    && sed -i "s|logfile /var/log/redis/redis.log|logfile|g" /etc/redis.conf \
    && sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis.conf

VOLUME /var/lib/redis
EXPOSE 6379
CMD ["/usr/bin/redis-server","--protected-mode","no"]
