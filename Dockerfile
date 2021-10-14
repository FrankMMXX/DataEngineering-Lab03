# Install base image
FROM adoptopenjdk/openjdk11:alpine

# Define local variables
ARG graphdbParentDirectory="/opt/graphdb"
ARG graphdbVersion
#ARG graphdbVersion="9.3.0"   # NO SPACES !!!
#RUN echo "graphdb-free-${graphdbVersion}-dist.zip"

# Install bash
RUN apk update && apk add --no-cache bash

# Prepare folders and files
WORKDIR $graphdbParentDirectory
COPY graphdb-free-${graphdbVersion}-dist.zip .
#ADD http://160.40.52.200:8084/graph-db/graphdb-free-9.3.0-dist.zip .
RUN unzip graphdb-free-${graphdbVersion}-dist.zip && \
    mv graphdb-free-${graphdbVersion} dist && \
    mkdir home

# Adjust environment variable PATH
ENV PATH=$PATH:${graphdbParentDirectory}/bin

# Define port
EXPOSE 7200

# Define executable
ENTRYPOINT ["graphdb"]
CMD ["-Dgraphdb.home=/opt/graphdb/home -Ddefault.min.distinct.treshold=10485760"]

#ENTRYPOINT [$graphdbParentDirectory/bin/graphdb]   # Pad niet nodig ivm aanpassing environment variable PATH