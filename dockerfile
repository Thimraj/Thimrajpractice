vi Dockerfile

# Use Centos as the base image
FROM centos:7

# Update the system and install the necessary packages
RUN yum update -y && \
    yum install -y java-1.8.0-openjdk-devel wget

# Set environment variables
ENV CATALINA_HOME /opt/tomcat
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0

# Create a directory for Tomcat and set it as the working directory
RUN mkdir -p ${CATALINA_HOME}
WORKDIR ${CATALINA_HOME}

# Download and extract the Tomcat distribution
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz && \
    tar xvf apache-tomcat-9.0.71.tar.gz --strip-components=1 && \
    rm apache-tomcat-9.0.71.tar.gz

# Expose the default Tomcat port
EXPOSE 8080

# Set the command to run when starting the container
CMD ["bin/catalina.sh", "run"]

