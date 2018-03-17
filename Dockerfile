FROM node:8-alpine
COPY . /node_docker
WORKDIR /node_docker
CMD [ "npm", "start" ]
EXPOSE 8080
