# Use the CentOS 7 as base image
FROM centos:7

# Update the system packages and install dependencies
RUN yum update -y && yum install -y java-1.8.0-openjdk-devel wget

# Download the latest version of Tomcat 8.5
RUN wget http://mirror.reverse.net/pub/apache/tomcat/tomcat-8/v8.5.89/bin/apache-tomcat-8.5.89.tar.gz

# Define environment variables
ENV CATALINA_HOME /opt/tomcat
ENV CATALINA_CONF $CATALINA_HOME/conf
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk

# Unzip Tomcat, rename it and delete the zip file
RUN tar -zxvf apache-tomcat-8.5.89.tar.gz && mv apache-tomcat-8.5.89 $CATALINA_HOME && rm apache-tomcat-8.5.89.tar.gz

# Copy the sample war file to the Tomcat webapps directory
COPY webapps/sample.war $CATALINA_HOME/webapps/sample.war

# Create Tomcat certs directory
RUN mkdir $CATALINA_CONF/certs

# Copy the private and public certificates to the previously created directory
COPY certs/private.pem $CATALINA_CONF/certs/private.pem
COPY certs/public.pem $CATALINA_CONF/certs/public.pem

# Copy the custom server file config to the Tomcat config directory
COPY conf/server.xml $CATALINA_CONF/

# Expose the SSL Port
EXPOSE 4041

# Start Tomcat service when the container launches
CMD ["/opt/tomcat/bin/catalina.sh", "run"]