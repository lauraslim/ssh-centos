FROM centos:7

RUN yum update

RUN yum install  openssh-server sudo -y

RUN useradd -g root -G sudo -u 1000 test 

RUN usermod -aG sudo test

RUN service ssh start

RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

