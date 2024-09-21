FROM node:18
WORKDIR /Bot

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/dedestem/DNBot/ .

RUN npm install
RUN chmod +x Run.sh

COPY Config.json ./Config.json

ENTRYPOINT ["bash", "Run.sh"]
