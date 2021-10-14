FROM alpine:latest

# Replace mirror
#RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main\n\
#https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/community" > /etc/apk/repositories

RUN apk --update add \
openjdk8 libseccomp g++ gcc python2 python3 nodejs && \
rm -rf /var/cache/apk/*

RUN mkdir /commit && adduser -D -h /commit/ -u 12800 -H commit && chmod -R 755 /commit

COPY ./run.sh /
COPY ./run /usr/bin

# Set environment
ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=${PATH}:${JAVA_HOME}/bin