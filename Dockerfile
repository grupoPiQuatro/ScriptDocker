FROM openjdk:17

WORKDIR /app

COPY ./app/teste-sprint-1.0-SNAPSHOT-jar-with-dependencies.jar /app

CMD ["java", "-jar", "teste-sprint-1.0-SNAPSHOT-jar-with-dependencies.jar"]