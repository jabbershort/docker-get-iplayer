FROM alpine:3.12

RUN apk add --no-cache \
	ffmpeg \
	openssl \
	perl-mojolicious \
	perl-lwp-protocol-https \
	perl-xml-simple \
	perl-xml-libxml \
	perl-cgi-session \
	perl-cgi

RUN apk add atomicparsley --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir -p /data/output /data/config

RUN wget https://raw.githubusercontent.com/get-iplayer/get_iplayer/master/get_iplayer
RUN install -m 755 ./get_iplayer /usr/local/bin

RUN wget https://raw.githubusercontent.com/get-iplayer/get_iplayer/master/get_iplayer.cgi
RUN install -m 755 ./get_iplayer.cgi /usr/local/bin

CMD get_iplayer --prefs-add --output /data/output && get_iplayer.cgi --listen 0.0.0.0 --port 1935
