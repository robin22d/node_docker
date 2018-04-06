FROM ibmcom/ibmnode

WORKDIR "/docker_node"

# Install app dependencies
COPY package.json /docker_node/
RUN apt-get update \
 && echo 'Finished installing dependencies'
RUN cd /docker_node; npm install --production

COPY . /docker_node

ENV NODE_ENV production
ENV PORT 9000

EXPOSE 9000
CMD [ "node", "index.js"]

