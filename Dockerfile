FROM node:latest
WORKDIR /app
COPY ./nodejs-hello /app
RUN npm install
CMD node app.js
EXPOSE 3000