FROM docker.io/library/maven:3.5-jdk-8-alpine
WORKDIR /app
COPY . /app
RUN mvn clean package

FROM docker.io/library/openjdk:8-jre-alpine
WORKDIR /app
COPY --from=0 /app/target/*.jar /app

# Uncomment the RUN line if the version has changed
# Then use the output of docker build to modify the
# .jar file name
#RUN ls

CMD ["java","-jar","spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"] 
