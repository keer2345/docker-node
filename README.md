**docker-node**

# Docker入门

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

## 关联到docker仓库

https://hub.docker.com/repository/create

可以关联 Github 创建 Docker 仓库。

关联完成后可以拉取到本地：

``` sh
docker pull keer2345/docker-node
```

# 指定执行的进程ENTRYPOINT
## 普通的执行
``` sh
docker run node:15.3.0 ls /etc
docker run node:15.3.0 cat /etc/hosts
docker run node:15.3.0 cat /etc/os-release

docker run node:15.3.0 node -v
```
## 实践
创建文件 Dockerfile

``` sh
FROM node:15.3.0

ENTRYPOINT ["node"]
CMD ["-v"]
```
运行：

``` sh
docker image build -t mynode .
docker run mynode
```
结果如下：

``` sh
v15.3.0
```

执行 JS 脚本：
``` sh
docker run mynode -e "console.log('hello')"
```

