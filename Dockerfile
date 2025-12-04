FROM nginxinc/nginx-unprivileged:stable-alpine

USER 0
COPY ./nginx /etc/nginx
RUN /bin/chown -R 1000 /etc/nginx
USER 1000

ENV NGINX_DOCKER_HOST=unix:/var/run/docker.sock
ENV NGINX_LISTEN=22375

EXPOSE 22375

LABEL orig_maintainer="Jens Thiel <thielj@gmail.com>"
LABEL orig_src="https://github.com/thielj/docker-health-proxy"

LABEL forker="damian-zh <214551289+damian-zh@users.noreply.github.com>"
LABEL org.opencontainers.image.source="https://github.com/damian-zh/docker-health-proxy"
