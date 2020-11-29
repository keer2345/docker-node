# docker-node

## 创建环境
``` sh
mkdir docker-node && cd docker-node

touch hello.js
echo "console.log('I love this game.')" > hello.js
```
## 获取镜像
``` sh
docker pull node:15.3.0
```
## 创建自己的镜像
建立 `Dockerfile` 文件：

``` sh
FROM node:15.3.0

RUN mkdir /src
COPY hello.js /src

CMD ["node", "/src/hello.js"]
```

创建自己的镜像：

``` sh
docker build -t keer2345/docker-node:v01 .
```
## 运行镜像
``` sh
> docker run keer2345/docker-node:v01
I love this game.
```

## 推送到Github

``` sh
git add .
git commit -m "docker-node-1"
git tag v01
git tag
git push --tags
```
