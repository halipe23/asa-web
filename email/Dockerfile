FROM ubuntu:latest

RUN apt update -y
RUN apt upgrade -y
RUN apt install postfix vim iputils-ping telnet dnsutils -y
RUN apt-get install dovecot-imapd dovecot-pop3d -y
RUN apt install -q -y syslog-ng
#copia o arquivo para server
COPY main.cf /etc/postfix
COPY 10-auth.conf /etc/dovecot/conf.d
#add usuarios email
RUN useradd -c 'Chico Moedas' -m moedas
RUN useradd -c 'Felipe' -m felipe
RUN useradd -c 'Luisa Sonza' -m sonsa
#RUN useradd -c 'Chico Moedas' -m -s /bin/false moedas
# Set user passord
RUN echo "moedas:redes" | chpasswd moedas 
RUN echo "sonsa:redes" | chpasswd sonsa 
RUN echo "felipe:redes" | chpasswd felipe

#CMD ["sh", "-C", "/sbin/postfix start-fg", "tail -f /var/log/maillog"]
CMD ["sh", "-c", "service syslog-ng start ; service postfix start ; service dovecot start; tail -F /var/log/mail.log"]
#CMD ["postfix", "start-fg"]