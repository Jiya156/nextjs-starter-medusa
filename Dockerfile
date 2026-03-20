FROM node:20-alpine

# Enable Corepack
RUN corepack enable

# Set working directory
WORKDIR /app

# Copy yarn files including .yarn folder with releases
COPY .yarn ./.yarn
COPY package.json yarn.lock .yarnrc.yml ./

# Install dependencies
RUN yarn install

# Copy all source code
COPY . .

# Copy env file
COPY .env.local .env.local

# Build Next.js — skip static generation during build
ENV NEXT_TELEMETRY_DISABLED=1
ENV SKIP_BUILD_STATIC_GENERATION=true

RUN yarn build

# Expose frontend port
EXPOSE 8000

# Start the application
CMD ["yarn", "start"]