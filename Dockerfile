FROM node:latest

# Install foremost
RUN apt-get update && apt-get install -y foremost

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy rest of the application
COPY . .

# Expose the port
EXPOSE 3001

# Start the application
CMD ["node", "server.js"]
