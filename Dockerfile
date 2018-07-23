FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y wget openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN mkdir /usr/local/dynamodb
WORKDIR /usr/local/dynamodb

RUN wget https://s3-ap-northeast-1.amazonaws.com/dynamodb-local-tokyo/dynamodb_local_latest.tar.gz && \
    tar -xf dynamodb_local_latest.tar.gz

ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb"]
