FROM node:20-alpine

# Enable Corepack for Yarn 4
RUN corepack enable && corepack prepare yarn@4.12.0 --activate

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json yarn.lock .yarnrc.yml ./

# Install dependencies
RUN yarn install

# Copy all source code
COPY . .

# Copy env file if exists
COPY .env.local .env.local

# Build Next.js application
RUN yarn build

# Expose frontend port
EXPOSE 8000

# Start the application
CMD ["yarn", "start"]