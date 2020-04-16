FROM centos:8

LABEL maintainer="lenny.consuegra@camptocamp.com"

# install needed packages
RUN dnf install -y cups \
 && dnf clean all \
 && rm -rf /var/cache/dnf

# expose port
EXPOSE 631

# copy init config file
COPY cups/cupsd.conf /etc/cups/

# start service
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["cupsd", "-f"]
