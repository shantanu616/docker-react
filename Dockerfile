FROM node:alpine as builder
WORKDIR /reactwork
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /reactwork/build /usr/share/nginx/html
