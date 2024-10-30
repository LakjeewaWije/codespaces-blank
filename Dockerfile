# Use an existing image as a base
FROM node:10-slim

# Set the working directory
WORKDIR /usr/src/app

# Copy the app.js file
COPY index.js .

# Expose the port that the app listens on
EXPOSE 3000

# Define the command to run the app
CMD ["node", "index.js"]