FROM centos
MAINTAINER laura

RUN yum update -y
RUN yum install -y openssh-server 
RUN mkdir /var/run/sshd

RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN echo 'root:pass' | chpasswd

CMD /usr/sbin/sshd && bash

EXPOSE 22

