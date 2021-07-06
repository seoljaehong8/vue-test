# build stage
FROM node:lts as build-stage

# 이미지 생성과정에서 실행할 명령어

# 이미지 내에서 명령어를 실행할(현 위치로 잡음) 디렉토리 설정
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
#CMD ["npm", "run", "serve"]
CMD ["nginx", "-g", "daemon off;"]



