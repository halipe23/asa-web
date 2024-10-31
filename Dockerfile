FROM ubuntu:latest

RUN apt update -y

RUN apt install bind9 dnsutils -y

EXPOSE 8089/tcp
EXPOSE 8089/udp

CMD [ "/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind" ]

#Copia arquivo da imagem
COPY named.conf.local /etc/bind

COPY db.asa.br /etc/bind