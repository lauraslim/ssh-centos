FROM centos
MAINTAINER laura

RUN yum install -y openssh-server 
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN yum  install -y openssh-clients

RUN useradd test
RUN echo "test:abc123" | chpasswd

RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN mkdir /var/run/sshd

ENTRYPOINT /etc/init.d/sshd start && /bin/bash

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
