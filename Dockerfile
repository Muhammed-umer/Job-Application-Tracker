# Stage 1: Build the App
FROM maven:3.8.5-openjdk-17 AS build
# FIX: Create a working directory so we don't overwrite system files
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the App
FROM eclipse-temurin:17-jdk-alpine
# FIX: Use the same directory structure
WORKDIR /app
# COPY --from=build /app/target/*.jar app.jar
# Change *.jar to *.war
COPY --from=build /app/target/*.war app.jar
EXPOSE 2006
ENTRYPOINT ["java", "-jar", "app.jar"]