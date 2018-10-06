set -e

mkdir -p /var/lib/nagios/spool/checkresults
mkdir -p /var/lib/nagios/rw
mkdir -p /var/cache/nagios
mkfifo -m 666 /tmp/lighttpd_logs
sed -i -e "s!^date.timezone.*!date.timezone=$TZ!" /etc/php5/php.ini
echo "$TZ" >/etc/TZ
ln -sf /usr/share/zoneinfo/$TZ /etc/localtime
supervisord
