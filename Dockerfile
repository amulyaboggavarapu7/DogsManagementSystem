# Build stage
FROM maven:3.8.2-jdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -Pprod -DskipTests

# Final stage
FROM openjdk:11-jdk-slim
WORKDIR /app
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
CMD ["java", "-jar", "DogsManagementSystem.jar"]
