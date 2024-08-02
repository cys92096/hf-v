#!/bin/bash
nginx -c /app/nginx.conf &
/app/v2ray run
