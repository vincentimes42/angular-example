### STAGE 1: Build ###
FROM node:14.15.5-alpine3.13 AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
ARG backendUrl
RUN npm i -g @angular/cli@12.1.4

# Install app dependencies:
RUN npm i 

COPY . .
RUN ng build
### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/* /usr/share/nginx/html