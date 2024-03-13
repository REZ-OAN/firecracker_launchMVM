FROM ubuntu:22.04

RUN mkdir -p /var/run/sshd 

RUN apt update && \
    apt install -y openjdk-8-jdk && \
    apt install -y openssh-server && \
    apt install -y iproute2 && \
    apt install -y net-tools && \
    apt install -y iptables && \
    apt install -y iputils-ping 

RUN passwd -d root
RUN mkdir /root/.ssh && \
    chmod 700 /root/.ssh

COPY ./key_pairs/id_rsa.pub /root/.ssh/authorized_keys

RUN chown root:root -R /root/.ssh && \
    chmod 600 /root/.ssh/authorized_keys

CMD [ "/usr/sbin/sshd","-D" ]