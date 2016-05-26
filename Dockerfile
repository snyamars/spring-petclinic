FROM tutum/tomcat

RUN rm -rf /tomcat/webapps/*

RUN apt-get update && apt-get install

RUN mkdir /opt/aspectj && cd /opt/aspectj &&\
    wget -O aspectjweaver-1.8.2.jar http://search.maven.org/remotecontent?filepath=org/aspectj/aspectjweaver/1.8.2/aspectjweaver-1.8.2.jar


ADD ./setenv.sh /tomcat/bin/setenv.sh

# Build petclinic
WORKDIR /spring-petclinic
RUN rm src/main/resources/stagemonitor.properties

ADD ./stagemonitor.properties /spring-petclinic/src/main/resources/stagemonitor.properties

RUN mv /spring-petclinic/target/petclinic.war /tomcat/webapps/petclinic.war &&\
