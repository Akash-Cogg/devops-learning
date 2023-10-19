# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory within the container
WORKDIR /src

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy all the source code to the working directory
COPY . .

# Build the React app (customize the build command if needed)
RUN npm run build

# Expose the port that the app will run on (typically 80 for HTTP)
EXPOSE 80

# Start the React app (customize the start command if needed)
CMD ["npm", "start"]