# build stage
FROM node:lts as build-stage

# 이미지 생성과정에서 실행할 명령어
<<<<<<< HEAD

=======
#RUN npm install -g @vue/cli
>>>>>>> afac4c6d43efda20c6d2f654c0e93c1abb43dc14
# 이미지 내에서 명령어를 실행할(현 위치로 잡음) 디렉토리 설정
WORKDIR /home/node/app

COPY package*.json ./
COPY . .

RUN npm install
RUN npm install -g @vue/cli

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
<<<<<<< HEAD
CMD ["nginx", "-g", "daemon off;"]
=======
>>>>>>> afac4c6d43efda20c6d2f654c0e93c1abb43dc14



