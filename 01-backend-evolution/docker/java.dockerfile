FROM maven:3.6.3-jdk-11-slim AS build

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN mvn clean package -DskipTests

FROM adoptopenjdk/openjdk11:jre-11.0.9.1_1-alpine
RUN apk add dumb-init
RUN mkdir /app
RUN addgroup --system javauser && adduser -S -s /bin/false -G javauser javauser

COPY --from=build /app/target/java-code-workshop-0.0.1-SNAPSHOT.jar /app/webapp.jar

WORKDIR /app
RUN chown -R javauser:javauser /app
USER javauser
CMD "dumb-init" "java" "-jar" "webapp.jar"
