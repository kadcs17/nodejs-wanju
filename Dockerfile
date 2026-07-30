
FROM node:alpine

ENV NODE_ENV=production

ENV PORT=3001

EXPOSE ${PORT}

WORKDIR /app


COPY index.js ./
COPY package.json ./
COPY start.sh ./
    
RUN apk update \
    && apk add --no-cache bash curl zsh \
    && chmod 777 start.sh \
    && npm install \
    && rm -rf /var/lib/apt/lists/*

CMD node index.js
