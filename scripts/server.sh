#!/bin/bash
template_file=/tmp/settings/ServerHostSettings.json.template
settings_file=/data/Settings/ServerHostSettings.json

steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir "/server" +login anonymous +app_update 1829350 validate +quit


cd /server
Xvfb :0 -screen 0 1024x768x16 & DISPLAY=:0.0 wine ./VRisingServer.exe -persistentDataPath /data
# /bin/bash