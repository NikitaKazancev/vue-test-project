FROM node:current-slim

WORKDIR /app

COPY /src /app/src
COPY index.html /app/
COPY package*.json /app/
COPY tsconfig*.json /app/
COPY vite.config.ts /app/

RUN npm i && npm cache clean --force \
	&& npm i @esbuild/linux-x64 esbuild-linux-64 \
	&& npm run build

EXPOSE 80

CMD ["npm", "run", "preview"]