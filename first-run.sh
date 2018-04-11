steamcmd +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /home/pixark +app_update 824360 validate +quit
apt update
apt --assume-yes install wine wine32 wine64 libwine libwine:i386 fonts-wine
export WINEARCH='win64'
wine wineboot --init
