FROM centos:8

LABEL maintainer="lenny.consuegra@camptocamp.com"

# install needed packages
RUN dnf install -y cups cronie-anacron \
 && dnf clean all \
 && rm -rf /var/cache/dnf

# add cups admin
RUN adduser --home /home/admin -G lp,wheel lpadmin

# expose port
EXPOSE 631

# copy init config files and config scripts
COPY cups /etc/cups
COPY docker-entrypoint.d /docker-entrypoint.d

# start service via entrypoint
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh", "cupsd"]
CMD ["-f"]
