FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/

RUN apt update -y

CMD [ "mkdir -p proxy/ssl | openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ | -keyout proxy/ssl/pipa.key \ | -out proxy/ssl/pipa.crt" ]