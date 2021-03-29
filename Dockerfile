FROM node:15.12-alpine as build

WORKDIR /app

COPY ./app/package*.json ./

RUN yarn install

COPY ./app ./

RUN yarn build



FROM nginx:1.19-alpine as production

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
