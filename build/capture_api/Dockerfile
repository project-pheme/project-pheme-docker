FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --update --no-cache autossh

ENV \
	AUTOSSH_LOGFILE=/dev/stdout \
	AUTOSSH_GATETIME=30         \
	AUTOSSH_POLL=10             \
	AUTOSSH_FIRST_POLL=30       \
	AUTOSSH_PORT=13000          

# Provide key for logging into server
COPY ./id_rsa /payload/id_rsa

ADD docker-entrypoint.sh /usr/local/bin

ENTRYPOINT [ "docker-entrypoint.sh" ]
