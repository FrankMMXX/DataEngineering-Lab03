# Install base image
FROM tomcat:7.0.103-jdk8-corretto

# Prepare folders and files
COPY bug-predictor-api.war /usr/local/tomcat/webapps/
RUN mkdir webapps/Ansibles

# Define port
EXPOSE 8081

# Define environment variables
ENV graphdb=http://graph-db:7200

# Define executable
CMD ["catalina.sh", "run"]