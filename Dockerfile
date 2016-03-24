FROM phusion/baseimage:latest

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"


RUN apt-get install redis-server -y

VOLUME /var/lib/redis


# copy "init" scripts for redis server, sentinal

COPY 10_redis-sentinal.sh /etc/my_init.d/10_redis-sentinal.sh
RUN chmod +x /etc/my_init.d/10_redis-sentinal.sh
COPY 50_redis-server.sh /etc/my_init.d/50_redis-server.sh
RUN chmod +x /etc/my_init.d/50_redis-server.sh


# port 6379 for redis server, 26379 for sentinel

EXPOSE 6379 26379

CMD ["/sbin/my_init"]


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

