FROM node:18.16-alpine3.16

WORKDIR /app

COPY ./package.json .
RUN npm cache clean --force
RUN npm install
COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]
