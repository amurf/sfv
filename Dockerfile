FROM node:alpine

WORKDIR /sfv
ADD package.json /sfv

RUN npm install

ADD . /sfv

CMD npm run dev
