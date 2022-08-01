FROM node:12-alpine
# Adding build tools to make yarn install work on Apple silicon / arm64 machines
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production
RUN apk add --no-cache python2 g++ make
COPY . .
CMD ["node", "src/index.js"]