FROM ubuntu:xenial

MAINTAINER Stephen Conklin

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y lsb-release && \
    apt-get install -y git && \
    apt-get install -y openssh-server && \
    apt-get install -y default-jre && \
    apt-get install -y sudo && \
    apt-get install -y iputils-ping
    
RUN mkdir /var/run/sshd

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Create Jenkins User
RUN mkdir /var/lib/jenkins/
RUN useradd -d /var/lib/jenkins/ -c "Jenkins user" jenkins  -s /bin/bash 
RUN chown -R jenkins /var/lib/jenkins/
RUN chgrp -R jenkins /var/lib/jenkins/

# Add the jenkins user to sudoers
COPY files/sudo-jenkins  /etc/sudoers.d

# RUN mkdir /home/jenkins/.ssh
# COPY files/jenkis_rsa.pub /home/jenkins/.ssh/authorized_keys


#USER jenkins


# Expose SSH port and run SSHD
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
