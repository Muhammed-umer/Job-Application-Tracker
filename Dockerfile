# # Use an official Java runtime as a parent image
# FROM openjdk:17-jdk-slim
#
# # Set the working directory inside the container
# WORKDIR /app
#
# # Copy everything into the container
# COPY . .
#
# # Give Maven wrapper permission to execute
# RUN chmod +x mvnw
#
# # Build the project (this creates the jar in /app/target)
# RUN ./mvnw clean package -DskipTests
#
# # Run the jar file (update the JAR name if it's different)
# CMD ["java", "-jar", "target/tracker-0.0.1-SNAPSHOT.jar"]

# Use Eclipse Temurin (The standard production JDK)
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# 1. Copy Maven wrapper and pom first (for caching)
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# 2. Fix line endings for Windows users & download dependencies
RUN sed -i 's/\r$//' mvnw

# 3. Copy source code
COPY src ./src

# 4. Build the application
RUN ./mvnw clean package -DskipTests

# 5. Run the application
CMD ["java", "-jar", "target/tracker-0.0.1-SNAPSHOT.jar"]