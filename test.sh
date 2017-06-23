docker build -t nagios . || exit
docker stop nagios1
docker rm nagios1

if [ -n "$1" ] ; then
  ep="--entrypoint=sh"
fi

docker run  --name=nagios1 -ti -p 8888:80 -v /etc/k8s/nagios-conf:/etc/nagios $ep nagios

