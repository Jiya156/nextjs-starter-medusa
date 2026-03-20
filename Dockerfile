# Use Node.js 20 Alpine as base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy all source code
COPY . .

# Copy env file
COPY .env.local .env.local

# Build Next.js application
RUN yarn build

# Expose frontend port
EXPOSE 8000

# Start the application
CMD ["yarn", "start"]