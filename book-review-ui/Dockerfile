FROM node:alpine
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY ./ ./
RUN npm i
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "start"]

# build environment
# FROM node:13.12.0-alpine as build
# WORKDIR /app
# ENV PATH /app/node_modules/.bin:$PATH
# COPY package.json ./
# COPY package-lock.json ./
# RUN npm ci --silent
# RUN npm install react-scripts@3.4.1 -g --silent
# COPY . ./
# RUN npm run build

# # production environment
# FROM nginx:stable-alpine
# WORKDIR /usr/share/nginx/html
# RUN rm -rf ./*
# COPY --from=build /app/build .

# #COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
# # new
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

### IMPORTANT: use this for customer envs in nginx image https://www.bencode.net/posts/react-build/