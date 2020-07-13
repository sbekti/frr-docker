FROM alpine:latest
ENV FRR_VERSION=7.3.1-r0
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
	&& apk add \
		--no-cache \
		--update-cache \
		tini \
		frr=$FRR_VERSION
COPY docker-start /usr/lib/frr/docker-start
ENTRYPOINT [ "/sbin/tini", "--", "/usr/lib/frr/docker-start" ]
