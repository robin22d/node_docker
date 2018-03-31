FROM node:8-alpine
COPY ./docker_node
WORKDIR /docker_node
RUN npm install
EXPOSE 9000
CMD [ "node", "index.js"]


