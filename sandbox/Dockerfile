FROM alpine:latest

# Replace mirror
#RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main\n\
#https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/community" > /etc/apk/repositories

RUN apk --update add \
openjdk8 libseccomp g++ gcc python2 python3 && \
rm -rf /var/cache/apk/*

RUN mkdir /commit && adduser -D -h /commit/ -u 12800 -H commit

COPY ./run.sh /
COPY ./run /commit/

# Set environment
#ENV JAVA_HOME /usr/lib/jvm/default-jvm
#ENV PATH ${PATH}:${JAVA_HOME}/bin