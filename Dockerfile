FROM centos
MAINTAINER laura

RUN yum update -y
RUN yum install -y openssh-server 
RUN mkdir /var/run/sshd

RUN echo 'root:pass' | chpasswd

CMD /usr/sbin/sshd && bash

EXPOSE 22

