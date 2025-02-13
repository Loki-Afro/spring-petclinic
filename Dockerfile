FROM docker.io/library/maven:3.5-jdk-8-alpine
WORKDIR /app
COPY pom.xml /app/pom.xml
RUN mvn dependency:go-offline
COPY src /app/src
RUN mvn clean package

FROM docker.io/library/openjdk:8-jre-alpine
WORKDIR /app
COPY --from=0 /app/target/*.jar /app/spring-petclinic.jar

CMD ["java","-jar","spring-petclinic.jar"]
