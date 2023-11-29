#!/bin/bash

docker network create dock_net
# c2433f7b562a406f1e0fd3e3f97e4b1a6a73161fc1e01eab548fe9e1da5eb1ad

docker run -itd --net dock_net --hostname namenode-master --name namenode --mount type=bind,src="$(pwd)/data",target="/root/data" -p 9870:9870 -p 8088:8088 hadoop_base:latest
# 0366a7e0f5a8c1f012cb026685c2fbcc83d722f852df6455f5072ee42c3ebe96

docker run -itd --net dock_net --hostname datanode1 --name datanode1 hadoop_base:latest
# 8bba9acf5ee16732ffbab0f389c8bcf20e85c43ad93d029c699f3e21cea1c24d

docker run -itd --net dock_net --hostname datanode2 --name datanode2 hadoop_base:latest
# 3e5529b6789b30445b01c2cee772e1e6faf0b6a0ace53a33427966bbeaf43681

docker exec namenode sh -c "hdfs namenode -format"
docker exec -it namenode bash

# start-all.sh

