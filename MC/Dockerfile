FROM amazoncorretto:21-alpine
WORKDIR /Server

# Update package lists and install screen
RUN apk update && apk add --no-cache screen

COPY PreServer/ ./Server

COPY Manager.sh ./Server/Manager.sh
RUN chmod +x ./Server/Manager.sh

EXPOSE 25565
ENTRYPOINT ["./Server/Manager.sh"]
