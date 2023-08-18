FROM node:16-alpine as builder
WORKDIR '/app'
copy package.json .
RUN npm install 
COPY . . 
RUN npm run build 

# /app/build has all of the stuff we care about in the code 

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html