FROM alpine
LABEL role='nginx' tags='nginx,loadblancer' description='nginx based on alpine'
#set language enviroments
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    TIMEZONE=Asia/Shanghai
#install software
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && apk upgrade --update && \
RUN apk upgrade --update && \
    apk add nginx tzdata nginx-mod-stream && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
   # Cleaning up
    rm -rf /var/cache/apk/*
#set ngx config
COPY nginx /etc/nginx
# Set Workdir
WORKDIR /var/www
# Expose volumes
#VOLUME ["/var/www"]
# Entry point
ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g","daemon off;"]
# Expose ports
EXPOSE 80
