FROM fedora:24
MAINTAINER N. Harrison Ripps <nhr@zig.mx>

RUN dnf install -y procps-ng expect znc && mkdir /opt/znc-env && mkdir /opt/znc-run
COPY znc_* /opt/znc-run/
RUN chown -R 1001:0 /opt/znc-env /opt/znc-run && chmod -R ug+rwx /opt/znc-env /opt/znc-run
USER 1001

EXPOSE 6697
ENTRYPOINT ["/opt/znc-run/znc_runner.sh"]
