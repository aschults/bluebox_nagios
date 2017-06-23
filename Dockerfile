FROM alpine
#RUN sed -i -e 's/v3\.[0-9][0-9]*/edge/g' /etc/apk/repositories
RUN apk update
RUN apk add ncurses coreutils wget curl gettext bash nagios nagios-plugins-all lighttpd nagios-web lighttpd-mod_auth php5
RUN apk add php5-common php5-iconv php5-json php5-gd php5-curl php5-xml php5-pgsql php5-imap php5-cgi fcgi
RUN apk add tzdata

RUN mkdir /run/lighttpd && chown lighttpd:lighttpd /run/lighttpd && mkdir /var/lib/nagios
RUN mv /etc/nagios /etc/nagios_orig


COPY lighttpd /etc/lighttpd

ADD nagios.sh /

VOLUME ["/etc/nagios","/var/log/nagios"]

ENV TZ=Europe/Zurich

ENTRYPOINT sh /nagios.sh
