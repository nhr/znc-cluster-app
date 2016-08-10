FROM fedora:24
MAINTAINER N. Harrison Ripps <nhr@zig.mx>

RUN dnf install -y expect znc
USER 1001
