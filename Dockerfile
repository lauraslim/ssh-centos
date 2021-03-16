FROM centos:latest

RUN yum update -y

RUN yum install openssh-server -y

RUN groupadd sudo

RUN useradd test 

RUN usermod -aG sudo test

RUN yum install systemd -y

RUN sudo systemctl start sshd

RUN sudo systemctl enable sshd

RUN sudo systemctl status sshd

RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
