FROM ubuntu:latest

RUN apt update -y

RUN apt install bind9 dnsutils -y
RUN apt-get -y install net-tools
RUN apt-get -y install iputils-ping

EXPOSE 53/tcp
EXPOSE 53/udp

CMD [ "/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind" ]

#Copia arquivo da imagem
COPY named.conf.local /etc/bind

COPY db.asa.br /etc/bind