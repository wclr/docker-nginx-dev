FROM caddy:2.7.6-alpine


RUN  apk add --update nodejs npm && npm install chokidar-cli -g

ENV SHELL=/bin/sh
ENV CADDY_RUN_OPTIONS="--config /etc/caddy/Caddyfile --adapter caddyfile"
ENV CADY_RELOAD_OPTIONS="${CADDY_RUN_OPTIONS}"
ENV WATCH_OPTIONS="--polling --poll-interval 1000"
ENV WATCH_FILES="/etc/caddy/**/*"

CMD caddy run ${CADDY_RUN_OPTIONS} & \
  chokidar ${WATCH_OPTIONS} ${WATCH_FILES} \
  -c "caddy reload ${CADY_RELOAD_OPTIONS}"
