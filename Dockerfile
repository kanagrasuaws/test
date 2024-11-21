FROM ubuntu:20.04
ENV TZ=Asia/Dubai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y
RUN apt-get -y install apache2
RUN echo "Hello Sample Application" > /var/www/html/index.html

# Configurable apache

RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh &&\
        echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh &&\
        echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh &&\
        echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh &&\
        chmod 755 /root/run_apache.sh
EXPOSE 80
CMD /root/run_apache.sh
