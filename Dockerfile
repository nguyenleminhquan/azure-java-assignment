FROM maven:3-jdk-8-alpine

WORKDIR /usr/src/app

COPY . /usr/src/app
RUN mvn package

ENV PORT 5000
EXPOSE $PORT
CMD [ "sh", "-c", "mvn -Dserver.port=${PORT} spring-boot:run" ]
HEALTHCHECK --timeout=10s \
    CMD wget --no-verbose --tries=1 --spider http://localhost:5000 || exit 1
