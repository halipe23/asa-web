FROM ubuntu:latest

RUN apt update --fix-missing -y
RUN apt upgrade -y
RUN apt-get install postfix dovecot-imapd dovecot-pop3d syslog-ng vim -y

#add usuarios email
RUN useradd -m moedas
RUN useradd -m rafael
# Set user passord
RUN echo 'moedas:redes' | chpasswd
RUN echo 'rafael:redes' | chpasswd
#Criar diretório temporário para Maildir
RUN mkdir -p /maildata/rafael/Maildir /maildata/moedas/Maildir && \
    chown -R rafael:rafael /maildata/rafael && \
    chown -R moedas:moedas /maildata/moedas && \
    chmod -R 700 /maildata/*
# Copiar script de inicialização
COPY init.sh /init.sh
RUN chmod +x /init.sh

ENTRYPOINT [ "/init.sh" ]