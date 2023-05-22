FROM openjdk:17

WORKDIR /app

COPY ./app/projeto-individual-java-jar-1.0-SNAPSHOT-jar-with-dependencies.jar /app

CMD ["java", "-jar", "projeto-individual-java-jar-1.0-SNAPSHOT-jar-with-dependencies.jar"]