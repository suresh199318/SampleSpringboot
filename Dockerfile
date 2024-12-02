FROM alpine/java:22-jre

LABEL version="1.0.0"
LABEL Auther="me-coder"

ARG jar_version
ENV JAR_VERSION=${jar_version}
WORKDIR /opt/spring-boot-hello-world
COPY target/spring-boot-2-hello-world-${jar_version}.jar .
EXPOSE 8080/tcp

CMD ["sh", "-c", "java -jar /opt/spring-boot-hello-world/spring-boot-2-hello-world-${JAR_VERSION}.jar"]
