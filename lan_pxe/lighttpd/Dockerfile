from debian:buster

RUN \ 
  apt update && \
  apt -y install  \
  curl \
  wget iputils-ping \
  net-tools lighttpd

COPY kickstart/ /var/www/html/
COPY preseed/ /var/www/html/

ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
