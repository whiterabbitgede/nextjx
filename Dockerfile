# Use the official Node.js image as the base image
# FROM node:20.18
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

#dev: runs next dev to start Next.js in development mode.
#build: runs next build to build the application for production usage.
#start: runs next start to start a Next.js production server.
#lint: runs next lint to set up Next.js' built-in ESLint configuration.

#npm run dev

# Build the React app for production
RUN npm run build



# Set environment variables for production
ENV NODE_ENV production
EXPOSE 3000

# Start Next.js
CMD ["npm", "run", "start"]


# docker build -t nextjs-node-20:0.0.1 .


