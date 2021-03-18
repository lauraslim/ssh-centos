FROM lauradocker84/ssh-centos7

RUN yum update -y

RUN yum install  openssh-server -y

RUN systemctl start sshd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

