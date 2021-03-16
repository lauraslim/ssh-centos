FROM centos:latest

RUN yum update -y

RUN yum install openssh-server -y

RUN groupadd sudo
RUN useradd test 
RUN usermod -aG sudo test
RUN rm -rf /etc/ssh
RUN service sshd start
RUN chkconfig sshd start
RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
