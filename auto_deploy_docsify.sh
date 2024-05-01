#!/bin/bash
# 删除之前部署的网站对应的目录
rm -rf ./blog
# 克隆仓库, 将会把项目所有内容克隆到当前目录的repo目录下(如果repo目录不存在会创建)
git clone git@github.com:will-liu0823/docsify_blog.git blog
# 将Dockerfile克隆到website目录的docs目录下
cp ./Dockerfile ./blog/docs
# 构建docker镜像
docker build -f ./blog/docs/Dockerfile -t docsify/blog .
# 运行docker镜像，通过-p来修改默认的3000端口避免端口冲突
# -v表示将:前面的目录(宿主机的目录)映射到容器的/docs目录
docker run -dp 9001:9001 --name=docsify -v $(pwd)/blog/docs:/docs docsify/blog