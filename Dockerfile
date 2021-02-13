FROM openjdk:15
WORKDIR /app
COPY ./target/prometheus-grafana-basic-0.0.1-SNAPSHOT.jar /app

EXPOSE 8081

CMD ["java", "-jar", "prometheus-grafana-basic-0.0.1-SNAPSHOT.jar"]