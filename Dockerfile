FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY . /tmp/
# COPY server /tmp/
# COPY webapp /tmp/
WORKDIR /tmp/
RUN mvn install
RUN mvn package

# FROM tomcat:9.0-jre8-alpine
# COPY --from=MAVEN_TOOL_CHAIN /tmp/target/wizard*.war $CATALINA_HOME/webapps/wizard.war

# HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/wizard/ || exit 1

# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "valaxytech@gmail.com" 
COPY COPY --from=MAVEN_TOOL_CHAIN /tmp/webapp/target/webapp.war /usr/local/tomcat/webapps

