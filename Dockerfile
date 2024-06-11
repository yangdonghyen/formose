FROM node:latest

# Install dependencies
RUN apt-get update && apt-get install -y foremost

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install npm dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Expose the port
EXPOSE 3001

# Start the application
CMD ["node", "server.js"]
