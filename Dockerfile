FROM node:alpine as builder 

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build <--- all the stuff we want to copy over during the build phase



FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
 
# nginx will start automatically, there is no need to specify any command to run it



