from debian:buster
RUN apt-get update
RUN apt -y install dnsmasq net-tools curl

ENTRYPOINT ["/usr/sbin/dnsmasq", "--no-daemon"]
