FROM openjdk
LABEL maintainer ="abc@mail.com"
EXPOSE 8761
WORKDIR /app
COPY target/eureka.jar /app/eureka.jar
ENTRYPOINT ["java", "-jar","eureka.jar"]