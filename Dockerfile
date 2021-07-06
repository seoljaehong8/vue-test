# build stage
FROM node:lts as build-stage

# 이미지 내에서 명령어를 실행할 디렉토리 설정
WORKDIR /home/node/app

COPY package*.json ./

RUN npm install --production

RUN npm install -g @vue/cli-service

COPY . .

RUN npm run build


# production stage
FROM nginx:stable-alpine as production-stage

COPY --from=build-stage home/node/app/dist /usr/share/nginx/html

EXPOSE 80
# 컨테이너 실행시 실행할 명령어
CMD ["nginx", "-g", "daemon off;"]



