# VRising Docker Dedicated Server
## What is it
> It's a Docker container to host a dedicated server for VRising.
>
> On my system it takes around 1 minute for the server to fully start but this will vary depending on your internet speed and computer.

# How to build and run
## docker
This is assuming that docker and git are installed on the system
```
git clone https://github.com/GoncaloTMelo/vrising-docker-server.git
cd vrising-docker-server
docker build . -t tvnvt/vrising-server
docker run -dit -e APP_PATH=/data -v /data/opt/vrising:/data -v vrisingVolume:/apps/vrising -p 9876:9876/udp -p 9877:9877/udp --name vrising-server tvnvt/vrising-server
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
docker image rm tvnvt/vrising-server
docker volume rm vrisingVolume
```
> If you also want to delete the server settings and worlds use the bellow command
```
rm -r /data/opt/vrising
```

## docker-compose
```
docker-compose rm -fsv
docker image rm tvnvt/vrising-server
docker volume rm vrising-docker-server_vrisingVolume
```
> If you also want to delete the server settings and worlds use the bellow command
```
rm -r /data/opt/vrising
```