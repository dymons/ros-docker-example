# ros-docker-example

```
docker pull ros:melodic
docker run -it ros:melodic
docker run --network host -it ros:melodic
docker run --network host -it --name roscore ros:melodic
docker run --network host --rm --name roscore -it ros:melodic
docker exec -it roscore bash
```

```
docker build -t ros-docker-example .
docker run --network host --rm --name roscore -it ros-docker-example
docker exec -it roscore bash
```

```
docker images
docker ps
docker ps -a
```

```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images --filter dangling=true -q)
docker system prune
```