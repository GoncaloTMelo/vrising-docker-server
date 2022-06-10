# VRising Docker Dedicated Server
## What it is
It's a Docker container to host a dedicated server for VRising

## How to run
### Docker Way
This is assuming that docker and git are installed on the system
```
git clone https://github.com/GoncaloTMelo/vrising-docker-server.git
cd vrising-docker-server
docker build . -t vrising-server
docker run -dit -e APP_PATH=/data -v /data/opt/vrising:/data -v vrisingVolume:/apps/vrising -p 9876:9876/udp -p 9877:9877/udp --name vrising-server vrising-server
```
### Docker-compose Way
This is assuming that docker and git are installed on the system
```
git clone https://github.com/GoncaloTMelo/vrising-docker-server.git
cd vrising-docker-server
docker-compose build
docker-compose up -d
```

## How to remove
```
docker container rm -f vrising-server
docker image rm -f vrising-server
docker volume rm vrisingVolume
```
> If you also want to delete the server settings and worlds use the bellow command
```
rm -r /data/opt/vrising
```