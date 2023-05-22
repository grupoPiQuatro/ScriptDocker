FROM openjdk:17

WORKDIR /app

COPY ./app/projeto-individual-java-jar-1.0-SNAPSHOT-jar-with-dependencies.jar /app
COPY ./app/my_env.txt /app

CMD ["java", "-jar", "projeto-individual-java-jar-1.0-SNAPSHOT-jar-with-dependencies.jar"]