
# docker build -t rpi-lanproxy-client:v1 . 
docker run -it rpi-lanproxy-client:v1
docker run -it buildpack-deps:stretch-scm
docker run -d -u root --name lanproxy-client --network=kong-net --restart=always huyisheng/rpi-lanproxy-client:latest


docker run -d -m 1500m --restart=always \
--network=kong-net \
--name jenkins -p 8084:80 \
-v /usr/local/data/jenkins:/root/.jenkins \
-v /usr/bin/docker:/usr/bin/docker \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /etc/sysconfig/docker:/etc/sysconfig/docker \
registry.cn-beijing.aliyuncs.com/haosenwei/g4m-jenkins-jdk11