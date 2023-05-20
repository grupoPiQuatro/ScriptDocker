FROM adoptopenjdk:17

WORKDIR /app

COPY ./app/login-screen-1.0-SNAPSHOT-jar-with-dependencies.jar /app

CMD ["java", "-jar", "SeuArquivo.jar"]