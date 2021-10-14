# Install base image
FROM adoptopenjdk/openjdk11:alpine

# Define local variables
ARG graphdbVersion
#ARG graphdbVersion="9.3.0"   # NO SPACES !!!
#RUN echo "graphdb-free-${graphdbVersion}-dist.zip"

# Install bash
RUN apk update && apk add --no-cache bash

# Prepare folders and files
WORKDIR /opt/graphdb/dist
RUN mkdir ../home
#ADD http://160.40.52.200:8084/graph-db/graphdb-free-9.3.0-dist.zip .
COPY graphdb-free-${graphdbVersion}-dist.zip .
RUN unzip graphdb-free-${graphdbVersion}-dist.zip

# Define port
EXPOSE 7200

# TODO
# Adjust PATH environment variables.
# Add ENTRYPOINT / CMD.
# GRAPHDB home as parameter?
# Docker variables gebruiken (om dubbele code te voorkomen).
# Install unzip does not seem necessary.


#########
# Oud
#########
## Using python 3.7 slim image as the base image
#FROM python:3.7.7-slim
## Defining working directory and copy the requirements file. We will run the commands inside this new directory
#WORKDIR /usr/src/myapp
## Copy requirements.txt  to the working directory
#COPY requirements.txt .
## Install required python packages
#RUN pip install --no-cache-dir -r requirements.txt
## Copy all files in training-db local host directory to /usr/src/myapp in Docker container
#COPY . .
## Expose the port that our app runs in
#EXPOSE 5000
## Environment  Variables
#ENV DB_URL=sqlite:///features.db
##Add some meta data if necessary
#LABEL training.db.api="0.0.1-beta"
## Run our App
#CMD ["python3","app.py"]
#
## We can also use an ENTRYPOINT and a CMD
## Run our App
##ENTRYPOINT ["python3"]
##CMD ["app.py"]