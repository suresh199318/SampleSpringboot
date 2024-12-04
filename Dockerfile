FROM maven:3.8.5-openjdk-17
EXPOSE 8080
ADD target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar app.jar

ENTRYPOINT exec java -jar -Djava.net.preferIPv4Stack=true app.jar