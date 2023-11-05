FROM debian:latest
EXPOSE 7860

RUN apt update && \
    apt install -y wget curl unzip nginx && \
    mkdir -p /app && \
    wget -O /app/v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.10.1/v2ray-linux-64.zip && \
    unzip /app/v2ray.zip -d /app && \
    rm -rf /app/v2ray.zip && \
    rm -rf /app/config.json && \
    wget -O /app/config.json https://raw.githubusercontent.com/ERR0RPR0MPT/hf-v2ray/main/v2ray-config.json && \
    wget -O /app/nginx.conf https://raw.githubusercontent.com/ERR0RPR0MPT/hf-v2ray/main/v2ray-nginx.conf && \
    wget -O /app/start.sh https://raw.githubusercontent.com/ERR0RPR0MPT/hf-v2ray/main/v2ray-start.sh && \
    chmod 777 -R /app && \
    chmod a+x -R /app && \
    chmod 777 -R /var/lib/nginx && \
    chmod a+x -R /var/lib/nginx && \
    nginx -t

WORKDIR /app

ENTRYPOINT ["/app/start.sh"]
