FROM ubuntu:latest

RUN apt update -y

RUN apt install bind9 dnsutils -y
RUN apt-get -y install net-tools
RUN apt-get -y install iputils-ping

EXPOSE 53/tcp
EXPOSE 53/udp
RUN mkdir /etc/bind/zones

CMD [ "/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind" ]