FROM debian:stretch

MAINTAINER rainbowdashboard

ENV DEBIAN_FRONTEND=noninteractive

ADD steamcmd.tar.xz /

RUN dpkg --add-architecture i386; apt-get update; \
apt-get install -y binutils ca-certificates libgcc1:i386 libstdc++6:i386 libtbb2:i386 libterm-ui-perl locales locales-all net-tools wine wine32 wine64 libwine libwine:i386 fonts-wine; \
export WINEARCH='win64';wine wineboot --init; steamcmd +quit; steamcmd +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /home/pixark +app_update 824360 validate +quit; \
rm -rf /root/.steam/logs/* /var/lib/apt/lists/* /tmp/*

CMD ["steamcmd"]