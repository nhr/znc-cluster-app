FROM fedora:24
MAINTAINER N. Harrison Ripps <nhr@zig.mx>

RUN dnf install -y expect znc && mkdir /opt/znc-env
COPY znc_* /opt/znc-env/
RUN chown -R 1001 /opt/znc-env
USER 1001
