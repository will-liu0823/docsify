FROM node:latest
LABEL description="A demo Dockerfile for build Docsify."
# 克隆仓库
WORKDIR /
COPY ./blog/docs ./docsify_blog/docs
WORKDIR /docsify_blog/docs
RUN npm install http-server -g && npm install -g docsify-cli@latest
EXPOSE 3000/tcp
ENTRYPOINT http-server ./ -p 3000