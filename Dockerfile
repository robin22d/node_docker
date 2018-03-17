FROM node:8-alpine
COPY . /docker_node
WORKDIR /docker_node
RUN npm install
CMD [ "node" "index.js"]
EXPOSE 8080
