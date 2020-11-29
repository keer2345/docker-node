FROM node:15.3.0

RUN mkdir /src
COPY hello.js /src

CMD ["node", "/src/hello.js"]
