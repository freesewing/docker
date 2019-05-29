FROM keymetrics/pm2:latest-alpine

# For people running this in a corporate environment
ARG http_proxy
ENV http_proxy=$http_proxy
ARG https_proxy
ENV https_proxy=$https_proxy
ARG no_proxy
ENV no_proxy=$no_proxy
ARG npm_registry
ENV NPM_CONFIG_REGISTRY=$npm_registry

# Environment vars 
ENV FS_BACKEND=http://localhost:6000
ENV FS_SITE=http://localhost:8000
#ENV FS_STATIC
#ENV FS_STORAGE
#ENV FS_MONGO_URI
#ENV MONGO_ENC_KEY
#ENV JWT_ISSUER
#ENV SMTP_HOST
#ENV SMTP_USER
#ENV SMTP_PASS
#ENV GITHUB_CLIENT_ID
#ENV GITHUB_CLIENT_SECRET
#ENV GOOGLE_CLIENT_ID
#ENV GOOGLE_CLIENT_SECRET
#ENV EDITOR_TOKEN

# Set node to production mode
ENV NODE_ENV production

# Fetch backend code
RUN mkdir /backend
WORKDIR /backend

# Install dependencies
RUN apk --no-cache --virtual build-dependencies \
  add git python make g++ \
  && git clone  --depth 1 https://github.com/freesewing/backend.git -b master . \
  && npm install \
  && npm install --global backpack-core \
  && apk del build-dependencies

# Fetch code
#RUN git clone  --depth 1 https://github.com/freesewing/backend.git -b master . 

# Build app
#RUN npm install && npm install --global backpack-core

# Clean up
#RUN apk del build-dependencies

# Add user to run the app
RUN addgroup -S freesewing \
  && adduser -S freesewing -G freesewing \
  && chown -R freesewing /backend

# Drop privleges and run app
USER freesewing
RUN npm run build && pm2-runtime build/main.js
