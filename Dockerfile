FROM registry.cn-beijing.aliyuncs.com/haosenwei/rpi-alpine-jdk11:latest
MAINTAINER hsw
ADD . /opt/lanproxy-client/
WORKDIR /opt/lanproxy-client
CMD ["sh","/opt/lanproxy-client/bin/startup.sh"]
