FROM node:10.19.0

# 이미지 생성과정에서 실행할 명령어
RUN npm install -g @vue/cli

# 이미지 내에서 명령어를 실행할(현 위치로 잡음) 디렉토리 설정
WORKDIR /home/node/app

COPY package*.json ./

# 컨테이너 실행시 실행할 명령어
CMD ["npm", "run", "serve"]



