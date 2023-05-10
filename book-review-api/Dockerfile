FROM node:20.1.0-alpine3.17
WORKDIR /app
COPY package.json ./
COPY tsconfig.json ./
COPY . ./src
RUN ls -a
RUN npm install
RUN npm run build

## this is stage two , where the app actually runs
FROM node:20.1.0-alpine3.17
WORKDIR /app
COPY package.json ./
RUN npm install --only=production
COPY --from=0 /app/dist .
EXPOSE 8000
CMD ["node","index.js"]