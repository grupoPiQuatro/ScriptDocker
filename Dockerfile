FROM openjdk:17

ARG login
ARG senha

ENV LOGIN=$login
ENV SENHA=$senha

RUN echo "Login: $LOGIN"
RUN echo "Senha: $SENHA"

WORKDIR /app

COPY ./app/projeto-individual-java-jar-1.0-SNAPSHOT-jar-with-dependencies.jar /app

CMD ["java", "-jar", "projeto-individual-java-jar-1.0-SNAPSHOT-jar-with-dependencies.jar"]