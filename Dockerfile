# Use a Node.js base image
FROM node:slim

# Install dependencies necessary for building native modules (if required)


# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies locally
# RUN npm install --production

# Install @sap/cds-dk globally
RUN npm install -g @sap/cds-dk --save
RUN npm install sqlite3 --save


# Copy the rest of the application code to the working directory
COPY . .

# Build the CAP project (optional, depending on your setup)
# RUN npx cds build --production

# Expose the application port (default for CAP is 4004)
EXPOSE 4004

# Start the CAP application
CMD ["npx", "cds", "run"]
