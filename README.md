# VRising Docker Dedicated Server
## What is it
It's a Docker container to host a dedicated server for VRising.

On my system it takes around 1 minute for the server to fully start but this will vary depending on your internet speed and computer.

If you already have your own server configurations you can replace them on the settings folder and when the server runs, it will run with you configurations instead of the default ones

# How to build and run
## docker
This is assuming that docker and git are installed on the system
```
git clone https://github.com/GoncaloTMelo/vrising-docker-server.git
cd vrising-docker-server
docker build . -t tvnvs/vrising-server
docker run -dit -e APP_PATH=/data -v /data/opt/vrising:/data -v vrisingVolume:/apps/vrising -p 9876:9876/udp -p 9877:9877/udp --name vrising-server tvnvs/vrising-server
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
docker volume rm vrisingVolume
```
> If you also want to delete the server settings and worlds use the bellow command
```
rm -r /data/opt/vrising
```

## docker-compose
```
docker-compose rm -fsv
docker image rm tvnvs/vrising-server
docker volume rm vrising-docker-server_vrisingVolume
```
> If you also want to delete the server settings and worlds use the bellow command
```
rm -r /data/opt/vrising
```