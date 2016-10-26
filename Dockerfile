FROM ubuntu:16.04

MAINTAINER Erik van den Bergh, Earlham Institute, Norwich

RUN apt update

# debug w/vim
RUN apt install -y vim libopenmpi-dev openmpi-common openmpi-bin wget autoconf gcc make
#RUN apt install -y libopenmpi-dev openmpi-common openmpi-bin wget autoconf gcc make

WORKDIR /root

RUN wget 'http://downloads.sourceforge.net/project/mrbayes/mrbayes/3.2.6/mrbayes-3.2.6.tar.gz'
RUN tar -xvzf mrbayes-3.2.6.tar.gz

WORKDIR /root/mrbayes-3.2.6/src

RUN autoconf
RUN ./configure --enable-mpi=yes --with-beagle=no
RUN make

RUN cp mb /usr/local/bin

COPY runmb.sh /tmp
RUN chmod ugo+x /tmp/runmb.sh

ENTRYPOINT ["/tmp/runmb.sh"]
