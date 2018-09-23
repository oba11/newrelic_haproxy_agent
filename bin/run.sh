#!/bin/bash

mkdir -p /etc/newrelic
cat << EOF > /etc/newrelic/newrelic_haproxy_agent.yml
newrelic:
  license_key: '${NEW_RELIC_LICENSE_KEY:=YOUR_LICENSE_KEY_HERE}'
  verbose: 0
agents:
  ${APP_NAME:=my-haproxy}:
    uri: ${STATS_URL:=http://127.0.0.1:1000/;csv}
    proxy: ${PROXY_NAME:=http_80}
    proxy_type: ${PROXY_TYPE:=backend}
    user: ${AUTH_USER}
    password: ${AUTH_PASS}
EOF

echo "# Proxy Name: ${PROXY_NAME:=http_80}"
echo "# Stats URL: ${STATS_URL:=http://127.0.0.1:1000/;csv}"
echo "# Proxy Type: ${PROXY_TYPE:=backend}"

exec /src/bin/newrelic_haproxy_agent run
