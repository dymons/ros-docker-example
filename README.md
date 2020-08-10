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
docker stop $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images --filter dangling=true -q)
docker system prune
```

```
docker-compose build
docker-compose up
```


----


https://github.com/pgigioli/darknet_ros/blob/cuda8_0-dev/Dockerfile
https://blog.zhaw.ch/icclab/challenges-with-running-ros-on-kubernetes/
https://github.com/shun/docker-ros-mqtt-topic-example/blob/master/docker-compose.yaml
https://github.com/bryanbutenhoff/pub-sub