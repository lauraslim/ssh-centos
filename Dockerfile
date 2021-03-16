FROM centos:latest

RUN yum update -y

RUN yum install openssh-server -y

RUN useradd -G sudo -u 1000 test 

RUN usermod -aG sudo test

RUN service ssh start

RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
