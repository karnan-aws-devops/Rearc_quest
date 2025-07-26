FROM node:10

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY certs/selfsigned.crt /app/certs/selfsigned.crt

COPY certs/selfsigned.key /app/certs/selfsigned.key

COPY src/ /app/src/

COPY bin/ /app/bin

EXPOSE 3000

CMD ["node", "src/000.js"]