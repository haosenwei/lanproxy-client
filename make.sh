#!/bin/sh
echo "build $1:$2"
version=v$2
if test  'master' != $1
then
  version="$1-v$2"
fi
echo $version

docker login --username=郝森伟 registry.cn-beijing.aliyuncs.com -p hao189108

docker build -t rpi-lanproxy-client:${version} .
echo `docker images -a| grep rpi-lanproxy-client | grep ${version} | awk '{print $3}' `

#docker tag rpi-lanproxy-client:${version} registry.cn-beijing.aliyuncs.com/haosenwei/rpi-lanproxy-client:${version}
#docker push registry.cn-beijing.aliyuncs.com/haosenwei/rpi-lanproxy-client:${version}

#docker tag rpi-lanproxy-client:${version} registry.cn-beijing.aliyuncs.com/haosenwei/rpi-lanproxy-client:latest
#docker push registry.cn-beijing.aliyuncs.com/haosenwei/rpi-lanproxy-client:latest

docker stop `docker ps -a| grep rpi-lanproxy-client | awk '{print $1}' `
docker rm   `docker ps -a| grep rpi-lanproxy-client | awk '{print $1}' `

docker run -d --name rpi-lanproxy-client\
              --network=kong-net  --restart=always \
              rpi-lanproxy-client:${version}