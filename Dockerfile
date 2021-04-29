FROM nginx:1.19.10-alpine

RUN  apk add --update nodejs npm && npm install chokidar-cli -g

ENV SHELL=/bin/sh
ENV NGINX_OPTIONS=
ENV POLLING="--polling"
ENV WATCH_FILES="/etc/nginx/conf.d/**/* /etc/nginx/conf.d/* /etc/nginx/nginx.conf"

# "nginx -s reload" sometimes fails to restart
CMD nginx ${NGINX_OPTIONS} -g 'daemon off;' & \
  chokidar ${POLLING} ${WATCH_FILES} \
  -c "pkill nginx | sleep 1 && nginx ${NGINX_OPTIONS} -g 'daemon off;' &"

# kill $(ps -ef | grep 'master process nginx' | awk '{print $1}') | sed -n '2p'