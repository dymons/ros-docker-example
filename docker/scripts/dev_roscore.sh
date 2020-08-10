#!/bin/bash

docker run \
    --detach \
    --network host \
    --rm \
    --name roscore \
    ros:melodic \
    roscore