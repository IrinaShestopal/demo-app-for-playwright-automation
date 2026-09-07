FROM amazoncorretto:21 AS build

WORKDIR /app

COPY . .

RUN ./mvnw clean package -DskipTests


FROM amazoncorretto:21

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]