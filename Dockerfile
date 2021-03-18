FROM centos:7

RUN yum update -y

RUN yum install  openssh-server sudo -y

RUN groupadd sudo

RUN useradd -g root -G sudo -u 1000 test 

RUN usermod -aG sudo test

RUN service sshd start

RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

