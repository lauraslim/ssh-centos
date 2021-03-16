FROM centos:latest

RUN yum update -y

RUN yum install openssh-server -y

RUN groupadd sudo
RUN useradd test 
RUN usermod -aG sudo test
RUN yum -y install initscripts && yum clean all
RUN dnf install python2 -y
RUN ln -s /usr/bin/python2 /usr/bin/python
RUN mv /usr/bin/systemctl /usr/bin/systemctl.old
RUN curl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py >temp
RUN mv temp /usr/bin/systemctl
RUN chmod +x /usr/bin/systemctl
RUN service sshd start

RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
