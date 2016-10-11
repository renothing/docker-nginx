# About this Repo
----

This repository contains **Dockerfile** of [Nginx](http://nginx.org) for [Docker](https://www.docker.com/)'s automated build.


### Base Docker Image

* [dockerfile/alpine](http://dockerfile.github.io/#/alpine)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/renothing/nginx/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull renothing/nginx:tag`

   (alternatively, you can build an image from Dockerfile: `docker build -t="nginx:tag" github.com/renothing/docker-nginx.git`)

3. default environments supported,you can change them before building.   
   the nginx start with port 80
```
    TIMEZONE=Asia/Shanghai
```
### Supported tags and respective 
* latest,1.10.1

### Usage

```
docker run -dit --name nginx -v yourapppath:/var/www renothing/nginx:tag
#link with backend server
docker run -dit --name nginx -v yourapppath:/var/www --link yourbackendserver:backend renothing/nginx:tag
#attach your own conf
docker run -dit --name nginx -v yourconfpath:/etc/nginx -v yourapppath:/var/www --link yourbackendserver:backend renothing/nginx:tag
#check logs
docker logs nginx
```
