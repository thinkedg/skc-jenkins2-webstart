FROM centos:7
MAINTAINER Maxfield Stewart

# Install Packages
RUN yum install -y git && \
    yum install -y wget && \
	yum install -y openssh-server && \
	yum install -y java-1.8.0-openjdk && \
	yum install -y sudo && \
	yum clean all

# Create Jenkins User
RUN mkdir /var/lib/jenkins/
RUN useradd -d /var/lib/jenkins/ -c "Jenkins user" jenkins  -s /bin/bash 
RUN chown -R jenkins /var/lib/jenkins/
RUN chgrp -R jenkins /var/lib/jenkins/

# # Create Jenkins User
# RUN useradd jenkins -m -s /bin/bash

# RUN chown -R jenkins /home/jenkins
# RUN chgrp -R jenkins /home/jenkins

# # Add the jenkins user to sudoers
# RUN echo "jenkins    ALL=(ALL)    ALL" >> etc/sudoers

# Set Name Servers
#COPY /files/resolv.conf /etc/resolv.conf

# Expose SSH port and run SSHD
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]




