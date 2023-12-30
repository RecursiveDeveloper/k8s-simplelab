FROM ubuntu:22.04

RUN apt update && \
    apt install -y nginx && \
    apt install -y supervisor && \
    apt clean

RUN echo 'Hello world supervisor' > /var/www/html/index.html

COPY supervisor_services.conf /etc/supervisor/conf.d/

EXPOSE 80/tcp

CMD supervisord -n -c /etc/supervisor/supervisord.conf
