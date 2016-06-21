FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y proftpd proftpd-mod-ldap proftpd-mod-vroot

ADD launch /launch
ADD proftpd.conf /etc/proftpd/proftpd.conf
ADD ldap.conf /etc/proftpd/ldap.conf
ADD modules.conf /etc/proftpd/modules.conf

RUN sudo chown root:root /etc/proftpd/modules.conf
RUN sudo chown root:root /etc/proftpd/proftpd.conf
RUN sudo chown root:root /etc/proftpd/ldap.conf

EXPOSE 21
EXPOSE 20

ENTRYPOINT /launch
