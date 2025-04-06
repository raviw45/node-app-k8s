FROM node:20
WORKDIR /myapp
COPY . .
RUN npm i
EXPOSE 3000
CMD [ "npm","start" ]