FROM centos

MAINTAINER himanshud1992@gmail.com

RUN mkdir -p /opt/tomcat

#WORKDIR /opt/tomcat/
#RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN curl -O http://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.24/bin/apache-tomcat-9.0.24.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.24/* /opt/tomcat/
RUN yum -y install java
RUN java -version

#WORKDIR /home/himanshu/java_war/login/target/
#RUN cd /home/himanshu/java_war/login/target/ && cp login.war /opt/tomcat/webapps/
COPY target/login.war /opt/tomcat/webapps/

EXPOSE 8090

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
