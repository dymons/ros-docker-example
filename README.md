# ros-docker-example

```
docker build -t ros-docker-example .
```

```
docker images
```

```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images --filter dangling=true -q)
```