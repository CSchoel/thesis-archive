# Build with docker:
# > docker build -t cschoel/omedit .
# Start with x11docker:
# > x11docker --hostwayland --share path/to/model cschoel/omedit:latest

FROM debian:latest

# requirements for openmodelica installation script
RUN apt-get update && apt-get install -y lsb-release wget gnupg qtwayland5
# install openmodelica
RUN for deb in deb deb-src; do echo "$deb http://build.openmodelica.org/apt `lsb_release -cs` release"; done \
    | tee /etc/apt/sources.list.d/openmodelica.list \
    && wget -q http://build.openmodelica.org/apt/openmodelica.asc -O- \
    | apt-key add - \
    && apt-get update \
    && apt-get install -y openmodelica omlib-modelica-3.2.3 omlib-modelicareference

CMD ["OMEdit"]