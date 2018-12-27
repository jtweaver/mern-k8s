FROM node:latest
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json .
COPY build ./build

# Utility to wait for MongoDB to start before running app
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait

RUN ls

RUN npm i
# Expose node port 5000 to host
EXPOSE 5000

# Wait for MongoDB to start then run (wait command configured in docker-compose.yml)
CMD /wait && npm run prod
