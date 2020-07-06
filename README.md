# docker cups

A ready to use CUPS server packaged inside a focal Ubuntu

## Usage

Start the container

    docker run -e ADMIN_PASSWORD=password -e LOG_LEVEL=debug -p 631:631 camptocamp/cups

Acces the web interface via https://localhost:631 and use the above password for the administration's section.

## Configuration

Default cupsd.conf file, override with the following if needed :

    docker run -e ADMIN_PASSWORD=password -v  $(pwd)/myconf:/etc/cups/cupsd.conf -p 631:631 camptocamp/cups
