FROM maven:3.8.5-openjdk-17-slim AS builder
WORKDIR /app

# Копируем только POM файл
COPY pom.xml .
#COPY cloud-storage-api/pom.xml cloud-storage-api/
#COPY cloud-storage-core/pom.xml cloud-storage-core/
#COPY cloud-storage-db/pom.xml cloud-storage-db/
#COPY cloud-storage-auth/pom.xml cloud-storage-auth/

# Скачиваем зависимости
RUN mvn dependency:go-offline -B

# Копируем исходный код
COPY . .

# Собираем проект
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/storage-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8087
ENTRYPOINT ["java", "-jar", "app.jar"]