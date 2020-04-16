FROM centos:8

LABEL maintainer="lenny.consuegra@camptocamp.com"

# install needed packages
RUN dnf install -y cups \
 && dnf clean all \
 && rm -rf /var/cache/dnf

# add cups admin
RUN adduser --home /home/admin -G lp,wheel lpadmin

# expose port
EXPOSE 631

# copy init config files
COPY cups/ /etc/cups/

# start service
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["cupsd", "-f"]
