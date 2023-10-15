# VRising Docker Dedicated Server
## What is it
It's a Docker container to host a dedicated server for VRising.

On my system it takes around 1 minute for the server to fully start but this will vary depending on your internet speed and computer.

If you already have your own server configurations you can replace them on the settings folder and when the server runs, it will run with you configurations instead of the default ones

# How to run
## Docker
```
docker run -dit -v /data/opt/vrising:/data -p 9876:9876/udp -p 9877:9877/udp --name vrising-server tvnvs/vrising-server
```
## Docker Compose
```
version: "3"
services:
  vrising:
    image: tvnvs/vrising-server:latest
    ports:
      - "9876:9876/udp"
      - "9877:9877/udp"
    volumes:
      - /data/opt/vrising/data:/data
```
# Settings
For more information on the server configuration see the [wiki](https://vrising.fandom.com/wiki/V_Rising_Dedicated_Server).
## Environment variables
The first time the container runs, if a ServerHostSettings.json is not found a new file will be created for you with the environment variables.
(Values from https://github.com/StunlockStudios/vrising-dedicated-server-instructions)

| Environment Variable              | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | ServerHostSettings.json propery name |
| :-------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------- |
| `VR_NAME` or `VR_SERVER_NAME`     | Name of the server. The name that shows up in server list.                                                                                                                                                                                                                                                                                                                                                                                                                     | `Name`                               |
| `VR_DESCRIPTION`                  | Short server description. Shows up in details panel of server list when entry is selected. Also printed in chat when connecting to server.                                                                                                                                                                                                                                                                                                                                     | `Description`                        |
| `VR_GAME_PORT`                    | UDP port for game traffic.                                                                                                                                                                                                                                                                                                                                                                                                                                                     | `Port`                               |
| `VR_QUERY_PORT`                   | UDP port for Steam server list features.                                                                                                                                                                                                                                                                                                                                                                                                                                       | `QueryPort`                          |
| `VR_ADDRESS` or `VR_BIND_ADDRESS` | Bind to a specific IP address.                                                                                                                                                                                                                                                                                                                                                                                                                                                 | `Address`                            |
| `VR_MAX_USERS`                    | Max number of concurrent players on server.                                                                                                                                                                                                                                                                                                                                                                                                                                    | `MaxConnectedUsers`                  |
| `VR_MAX_ADMINS`                   | Max number of admins to allow connect even when server is full.                                                                                                                                                                                                                                                                                                                                                                                                                | `MaxConnectedAdmins`                 |
| `VR_FPS` or `VR_TARGET_FPS`       | Target FPS for server.                                                                                                                                                                                                                                                                                                                                                                                                                                                         | `ServerFps`                          |
| `VR_PASSWORD`                     | Set a password or leave empty.                                                                                                                                                                                                                                                                                                                                                                                                                                                 | `Password`                           |
| `VR_SECURE`                       | Enable VAC protection on server. VAC banned clients will not be able to connect.                                                                                                                                                                                                                                                                                                                                                                                               | `Secure`                             |
| `VR_LIST_ON_MASTER_SERVER`        | Register on list server or not.                                                                                                                                                                                                                                                                                                                                                                                                                                                | `ListOnMasterServer`                 |
| `VR_PRESET`                       | Load a ServerGameSettings preset.                                                                                                                                                                                                                                                                                                                                                                                                                                              | `GameSettingsPreset`                 |
| `VR_SAVE_NAME`                    | Name of save file/directory. Must be a valid directory name.                                                                                                                                                                                                                                                                                                                                                                                                                   | `SaveName`                           |
| `VR_SAVE_COUNT`                   | Number of autosaves to keep.                                                                                                                                                                                                                                                                                                                                                                                                                                                   | `AutoSaveCount`                      |
| `VR_SAVE_INTERVAL`                | Interval in seconds between each auto save.                                                                                                                                                                                                                                                                                                                                                                                                                                    | `AutoSaveInterval`                   |
| `VR_LAN_MODE`                     | Enable LAN mode.                                                                                                                                                                                                                                                                                                                                                                                                                                                               | `LanMode`                            |
| `VR_RESET_DAYS_INTERVAL`          | Days between scheduled resets/wipes. When the server starts, and is about to load a save file, it checks if it is time to reset and start a new save file. The previous save file is backed up. Defaults to `0`, which means the feature is disabled.                                                                                                                                                                                                                          | `ResetDaysInterval`                  |
| `VR_DAY_OF_RESET`                 | If you want the server to reset on Saturdays, every two weeks, but it is not Saturday when you initially set up you server then you can set `ResetDaysInterval` to `14` and then set this to `Saturday`. It will check that at least `ResetDaysInterval` days has passed and that it is the day of `DayOfReset`. If you do not want to restrict reset to a specific day, but just rely on the value of `ResetDaysInterval`, then set this to `Any`, which is also the default. | `DayOfReset`                         |
### Rcon
| Environment Variable | Description                           | ServerHostSettings.json propery name |
| :------------------- | :------------------------------------ | :----------------------------------- |
| `VR_RCON_ENABLED`    | Enable or disable Rcon functionality. | `Enabled`                            |
| `VR_RCON_PORT`       | Rcon TCP port.                        | `Port`                               |
| `VR_RCON_PASSWORD`   | Password to access RCON.              | `Password`                           |

# How to build and run
## docker
This is assuming that docker and git are installed on the system
```
git clone https://github.com/GoncaloTMelo/vrising-docker-server.git
cd vrising-docker-server
docker build . -t tvnvs/vrising-server
docker run -dit -e APP_PATH=/data -v /data/opt/vrising:/data -p 9876:9876/udp -p 9877:9877/udp --name vrising-server tvnvs/vrising-server
```
## docker-compose
This is assuming that docker and git are installed on the system
```
git clone https://github.com/GoncaloTMelo/vrising-docker-server.git
cd vrising-docker-server
docker-compose build
docker-compose up -d
```


# How to remove
## docker
```
docker container stop vrising-server
docker container rm vrising-server
docker image rm tvnvs/vrising-server
```
> If you also want to delete the server settings and worlds use the bellow command
```
rm -r /data/opt/vrising
```

## docker-compose
```
docker-compose rm -fsv
docker image rm tvnvs/vrising-server
```
> If you also want to delete the server settings and worlds use the bellow command
```
rm -r /data/opt/vrising
```