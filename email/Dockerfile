FROM ubuntu:latest

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install postfix dovecot-imapd dovecot-pop3d syslog-ng vim -y
#copia o arquivo para server
COPY postifix-dovecot/main.cf /etc/postfix
COPY 10-auth.conf /etc/dovecot/conf.d
#add usuarios email
RUN useradd -c 'Chico Moedas' -m moedas
RUN useradd -c 'rafael' -m rafael
# Set user passord
RUN echo "moedas:redes" | chpasswd moedas 
RUN echo "rafael:redes" | chpasswd rafael
#Criar diretório temporário para Maildir
RUN mkdir -p /maildata/rafael/Maildir /maildata/moedas/Maildir && \
    chown -R rafael:rafael /maildata/rafael && \
    chown -R moedas:moedas /maildata/moedas && \
    chmod -R 700 /maildata/*
CMD ["sh", "-c", "service syslog-ng start ; service postfix start ; service dovecot start; tail -F /var/log/mail.log"]
# Copiar script de inicialização
COPY init.sh /init.sh
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]