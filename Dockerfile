# Use a base image with Java runtime
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Spring Boot application JAR file into the container
COPY target/spring-boot-2-hello-world.jar1.0.2-SNAPSHOT.jar /app.jar

# Expose port 8081
EXPOSE 8081

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app.jar"]
