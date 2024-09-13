FROM node:alpine

WORKDIR /app

# Copy only package.json and package-lock.json (or yarn.lock) first for better cache efficiency
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the application
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
