FROM centos7/systemd

RUN yum update -y

RUN yum install  openssh-server -y

RUN systemctl start sshd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

