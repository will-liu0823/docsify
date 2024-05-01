#!/bin/bash
# 0. 获取当前运行的容器id
container_id=`docker ps -a | grep docsify | awk '{print $1}'`
# 1. 获取容器的镜像名
image_name=`docker images | grep docsify | awk '{print $3}'`

# 2. 如果容器不为空
if [ ${container_id} != "" ]; then
    echo "container_id is" ${container_id}
    # 2.1 停止当前运行的docker容器
    docker kill ${container_id}
    echo "succeed to stop container"
    # 2.2 移除停止的docker容器
    docker rm ${container_id}
    echo "succeed to remove container"
fi

# 3. 如果镜像不为空
if [ ${container_id} != "" ]; then
	# 3.1 移除构建出的docker镜像
    docker rmi ${image_name}
    echo "succeed to remove images"
fi

# 4. 重新执行自动部署脚本
./auto_deploy_docsify.sh