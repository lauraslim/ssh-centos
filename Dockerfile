FROM centos:latest

RUN yum update -y

RUN yum install openssh-server -y

RUN groupadd sudo

RUN useradd test 

RUN usermod -aG sudo test

RUN systemctl restart sshd.service

RUN systemctl enable sshd.service

RUN systemctl status sshd.service

RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
