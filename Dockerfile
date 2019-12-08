###############
# Build stage #
###############
FROM adoptopenjdk:11.0.4_11-jdk-hotspot AS builder
WORKDIR /work

# cache gradlew
COPY gradle /work/gradle
COPY gradlew /work/gradlew
RUN ./gradlew

# cache dependencies
COPY build.gradle /work/build.gradle
COPY src/main/java/dev/takitake/demo/DemoApplication.java /work/src/main/java/dev/takitake/demo/DemoApplication.java
RUN ./gradlew classes

# build application
COPY . /work
RUN ./gradlew build

#############
# APP stage #
#############
FROM adoptopenjdk:11.0.4_11-jre-hotspot
WORKDIR /work
COPY --from=builder /work/build/libs/*.jar /work/app.jar
CMD ["java", "-jar", "app.jar"]
