FROM ubuntu:focal

LABEL maintainer="lenny.consuegra@camptocamp.com"

# install needed packages
RUN apt-get update \
 && DEBIAN_FRONTEND="noninteractive" apt-get install -y cups \
 && rm -rf /var/lib/apt/lists/*

# add cups admin
RUN useradd -m -g lpadmin lpadmin

# expose port
EXPOSE 631

# copy init config files and config scripts
COPY cups /etc/cups
COPY docker-entrypoint.d /docker-entrypoint.d

# start service via entrypoint
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["cupsd", "-f"]
