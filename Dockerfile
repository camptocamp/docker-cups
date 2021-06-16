FROM ubuntu:focal

LABEL maintainer="lenny.consuegra@camptocamp.com"

# install needed packages
RUN apt-get update \
 && DEBIAN_FRONTEND="noninteractive" apt-get install -y cups \
 && rm -rf /var/lib/apt/lists/*

# add CAB drivers and filter module
COPY files/ppd /usr/share/ppd/cab
COPY files/rastertocab /usr/lib/cups/filter/rastertocab

# add cups admin
RUN useradd -g lpadmin lpadmin

# expose port
EXPOSE 631

# copy init config files and config scripts
COPY cups /etc/cups
COPY docker-entrypoint.d /docker-entrypoint.d

# start service via entrypoint
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh", "cupsd"]
CMD ["-f"]
