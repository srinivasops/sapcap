# Use a Node.js base image
FROM node:18-alpine

# Install dependencies necessary for building native modules (if required)
RUN apk add --no-cache python3 make g++ 

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies, including @sap/cds-dk globally
RUN npm install --production && npm install -g @sap/cds-dk

# Copy the rest of the application code to the working directory
COPY . .

# Build the CAP project (optional, depending on your setup)
RUN npx cds build --production

# Expose the application port (default for CAP is 4004)
EXPOSE 4004

# Start the CAP application
CMD ["npx", "cds", "run"]
