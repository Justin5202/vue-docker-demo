FROM node:6.10.3-slim
# install nginx
RUN apt-get update \
    && apt-get install -y nginx
WORKDIR /app
COPY . /app/
# container port
EXPOSE 80
RUN npm install \
    && npm run build \
    && cp -r dist/* /var/www/html \
    && rm -rf /app
CMD ["nginx","-g","daemon off;"]