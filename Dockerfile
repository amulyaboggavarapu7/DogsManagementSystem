# Stage 1: Build the application
FROM maven:3-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -Pprod -DskipTests

# Stage 2: Create the final image
FROM eclipse-temurin:17-alpine
WORKDIR /app
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
EXPOSE 8080
CMD ["java", "-jar", "DogsManagementSystem.jar"]
