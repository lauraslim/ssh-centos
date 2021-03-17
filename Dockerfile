FROM centos
MAINTAINER laura

RUN yum install -y openssh-server sudo
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN yum  install -y openssh-clients

RUN echo "root:abc123" | chpasswd
RUN echo "root   ALL=(ALL)       ALL" >> /etc/sudoers
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN service sshd start
RUN service sshd status

RUN yum install -y docker.io
RUN service docker start
RUN service docker status

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
