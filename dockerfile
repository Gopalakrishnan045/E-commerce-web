# Use Node.js base image
FROM node:20

# Set working directory inside container
WORKDIR /app

# Copy package files and install deps
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Copy the rest of the project
COPY . .

# Expose Angular dev server port
EXPOSE 4200

# Start Angular dev server
#CMD ["npm", "run", "start", "--", "--host", "0.0.0.0", "--port", "4200"]
CMD ["node", "--openssl-legacy-provider", "node_modules/@angular/cli/bin/ng", "serve", "--host", "0.0.0.0", "--port", "4200"]


