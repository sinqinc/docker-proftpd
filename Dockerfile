FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y proftpd

ADD launch /launch
ADD proftpd.conf /etc/proftpd/proftpd.conf
ADD ldap.conf /etc/proftpd/ldap.conf

RUN sudo chown root:root /etc/proftpd/proftpd.conf
RUN sudo chown root:root /etc/proftpd/ldap.conf

EXPOSE 21
EXPOSE 20

ENTRYPOINT /launch
