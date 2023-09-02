FROM debian:bullseye-slim

WORKDIR /tmp
RUN apt update && apt-get install -y wget unzip
RUN wget https://github.com/kkcloudy/RapidScada/raw/master/RapidScada.zip && unzip RapidScada.zip
RUN cp -r RapidScada/scada /opt/scada
RUN cp -r RapidScada/daemons/* /etc/init.d/
RUN chmod -R ugo+rwx /opt/scada/ScadaWeb/config
RUN chmod -R ugo+rwx /opt/scada/ScadaWeb/log
RUN chmod -R ugo+rwx /opt/scada/ScadaWeb/storage
RUN chmod +x /opt/scada/make_executable.sh && /opt/scada/make_executable.sh

RUN apt update
RUN apt-get install -y apt-transport-https dirmngr gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update && apt-get install -y mono-complete apache2 libapache2-mod-mono mono-apache-server4
RUN ln -s /opt/scada/ScadaWeb /var/www/html/scada
RUN cp RapidScada/apache/scada.conf /etc/apache2/sites-available
RUN a2ensite scada.conf
RUN /opt/scada/svc_install.sh
RUN rm -rf /tmp/*
WORKDIR /opt/scada
ENTRYPOINT ["./scadastart.sh"]

