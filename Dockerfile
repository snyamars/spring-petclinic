FROM tutum/tomcat

RUN rm -rf /tomcat/webapps/*

ADD ./setenv.sh /tomcat/bin/setenv.sh

# Build petclinic
WORKDIR /spring-petclinic
RUN rm src/main/resources/stagemonitor.properties

ADD ./stagemonitor.properties /spring-petclinic/src/main/resources/stagemonitor.properties

RUN mv /spring-petclinic/target/petclinic.war /tomcat/webapps/petclinic.war &&\
