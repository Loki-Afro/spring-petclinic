FROM docker.io/library/maven:3.5-jdk-8-alpine
WORKDIR /app
COPY pom.xml /app/pom.xml
RUN mvn dependency:resolve
COPY src /app/src
RUN mvn clean package

FROM docker.io/library/openjdk:8-jre-alpine
WORKDIR /app
RUN mkdir /app
COPY --from=0 /app/target/*.jar /app

CMD ["java","-jar","spring-petclinic-*.jar"]
