# Install base image
FROM tomcat:7.0.103-jdk8-corretto

# Prepare folders and files
COPY reasoner-api.war /usr/local/tomcat/webapps/
RUN mkdir webapps/Ansibles

# Define port
EXPOSE 8080

# Define environment variables
ENV graphdb=http://graph-db:7200
ENV bugPredictorServer=http://tosca-smell:8080/
ENV ansiblePath=/usr/local/tomcat/webapps/Ansibles/
ENV reasonerServer=http://semantic-web:8080/

# Define executable
CMD ["catalina.sh", "run"]


#ENTRYPOINT ["catalina.sh"]
#CMD ["run"]