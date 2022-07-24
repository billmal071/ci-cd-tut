FROM node:14-alpine

RUN groupadd -r myapp && useradd -g myapp myapp

RUN chown -R myapp:myapp /app

USER myapp

WORKDIR /usr/src/app

COPY package*.json ./

RUN if [ "$NODE_ENV" = "development" ]; \
  then npm install; \
  else npm install --only=production; \
  fi

COPY . ./

EXPOSE 3000

CMD ["npm", "start"]
