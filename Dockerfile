FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests


FROM eclipse-temurin:21-jre

COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:1.0.1 \
/lambda-adapter /opt/extensions/lambda-adapter

WORKDIR /app

COPY --from=build \
/app/target/java-serverless-api-1.0.0.jar app.jar

ENV PORT=8080

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]