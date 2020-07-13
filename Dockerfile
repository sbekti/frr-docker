FROM alpine:edge
RUN mkdir -p /pkgs/apk
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
	&& apk add \
		--no-cache \
		--update-cache \
		tini \
		frr=7.4-r0
COPY docker-start /usr/lib/frr/docker-start
ENTRYPOINT [ "/sbin/tini", "--", "/usr/lib/frr/docker-start" ]
