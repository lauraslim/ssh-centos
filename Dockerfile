FROM centos:latest

RUN yum update -y

RUN yum install openssh-server -y

RUN groupadd sudo

RUN useradd test 

RUN usermod -aG sudo test

RUN yum -y install initscripts && yum clean all

RUN yum install systemd -y

RUN service sshd start

RUN service sshd enable

RUN service sshd status

RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
