# Section 1 - Build Phase
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

# Not needed as it could use the files from local machine and not need to copy to container the files
COPY . . 
RUN npm run build

# Section 2 - Run Phase
FROM nginx
COPY --from=builder /app/build usr/share/nginx/html