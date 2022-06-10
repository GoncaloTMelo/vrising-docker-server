#!/bin/bash
export WINEARCH=win64

steamcmd +force_install_dir "/apps/vrising" +login anonymous +app_update 1829350 +quit

[[ -d /data/Settings ]] || cp /tmp/settings /data/Settings -r


Xvfb :0 -screen 0 1024x768x16 &
DISPLAY=:0.0 wine /apps/vrising/VRisingServer.exe -persistentDataPath "Z:/data"
/bin/bash