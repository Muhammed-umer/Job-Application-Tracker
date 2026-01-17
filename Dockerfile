# Stage 1: Build the App
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the App
FROM openjdk:17-jdk-slim
COPY --from=build /target/*.jar app.jar
EXPOSE 2006
ENTRYPOINT ["java", "-jar", "app.jar"]