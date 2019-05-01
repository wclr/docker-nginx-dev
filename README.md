# Nginx dev

> Nginx alpine container that watches config files and restarts.

```
image: 'whitecolor/nginx-dev:1.13.7-alpine',
volumes: [
  `./app/nginx-configs:/etc/nginx/conf.d:ro`
]
```
