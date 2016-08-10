FROM fedora:24
MAINTAINER N. Harrison Ripps <nhr@zig.mx>

RUN dnf install -y expect znc && mkdir /opt/znc-env && mkdir /opt/znc-run
COPY znc_* /opt/znc-run/
RUN chown -R 1001 /opt/znc-env /opt/znc-run
USER 1001
