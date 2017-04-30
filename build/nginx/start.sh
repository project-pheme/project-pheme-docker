#!/bin/sh

set -ex

cat > /etc/nginx/conf.d/upstream.conf << EOF
upstream api_backend {
	server ${API_HOST}:${API_PORT};
}
EOF

  cat > /var/app/server/www/config.js <<EOF
// Configure platform-client to reach the api at the subpath /platform in the same domain
//
window.ushahidi = {
  backendUrl : "/"
};
EOF

exec /usr/sbin/nginx -g 'daemon off;'
